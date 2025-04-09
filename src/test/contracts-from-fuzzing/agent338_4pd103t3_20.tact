struct Deep {
  a: Int = 99;
  b: String = "default";
  c: Bool?;         // implicit null
}

struct Outer {
  deep: Deep;
  intVal: Int;
}

contract TestContract {
  val: Outer;

  init() {
    self.val = Outer{
      deep: Deep{},   // omit fields, get defaults
      intVal: 42
    };
  }
}