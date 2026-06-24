contract DefaultOptional {
  a: Int = 5;
  b: String?;
  
  init() {
    self.b = null;
  }
}