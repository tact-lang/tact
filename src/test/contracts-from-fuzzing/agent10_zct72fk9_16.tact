contract X {
  fun f(a: Int, b: Int,) : Int {
    return a + b;
  }

  receive() {
    self.f(1, 2,);
  }
}