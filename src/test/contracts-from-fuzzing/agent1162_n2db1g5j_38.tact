contract Simple {
  a: Int;

  init() {
    self.a = 5;
  }

  get fun a_val(): Int {
    return self.a;
  }
}