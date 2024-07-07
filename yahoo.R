FLAGS <- flags(
  flag_numeric("nodes", 128),
  flag_numeric("batch_size", 100),
  flag_string("activation", "relu"),
  flag_numeric("learning_rate", 0.01),
  flag_numeric("epochs", 30)
)

model =keras_model_sequential() 
model %>%
  layer_dense(units = FLAGS$nodes, activation =FLAGS$activation, , input_shape = dim(yahoo1_train_dtm)[2]) %>%
  layer_dense(units = 10, activation = 'softmax')

model %>% compile(
  optimizer = optimizer_adam(lr=FLAGS$learning_rate),
  loss = 'sparse_categorical_crossentropy',
  metrics = c('accuracy')
)
model %>% fit(yahoo1_train_dtm, yah1_train_label, epochs = 30, batch_size=100, validation_data=list(yahoo1_test_dtm, yah1_test_label))