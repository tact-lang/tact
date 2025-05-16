struct RecA {
  val: Int;
}

struct RecB {
  x: RecA?;
  y: Bool;
}

struct RecC {
  z: RecB?;
  q: String;
}

contract OptNested {
  storage: RecC;

  init() {
    self.storage = RecC{
      z: null,
      q: "hi"
    };
  }
}