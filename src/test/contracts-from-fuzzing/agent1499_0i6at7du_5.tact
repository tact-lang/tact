struct Deep1 {
  val: Int;
}

struct Deep2 {
  nested: Deep1;
}

struct Deep3 {
  nested2: Deep2;
}

contract VeryDeepTest {
  deep: Deep3?;

  init() {
    self.deep = null;
  }
  receive() {}
}