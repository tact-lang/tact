struct Info {
  count: Int;
  label: String;
}

contract TestContract {
  a: Int;
  b: Int?;
  c: Bool?;
  d: Info?;
  e: String;

  init() {
    self.a = 5;
    self.b = null;
    self.c = null;
    self.d = null;
    self.e = "done";
  }
}