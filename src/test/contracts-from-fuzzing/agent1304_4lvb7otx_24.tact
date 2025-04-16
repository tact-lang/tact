struct S {
  s: String? = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz";
}

contract OptLongString {
  data: S;

  init() {
    self.data = S{};
  }
}