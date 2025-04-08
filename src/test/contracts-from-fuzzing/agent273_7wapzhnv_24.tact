struct Outer {
  intVal: Int;
  nested: Inner;
}

struct Inner {
  boolVal: Bool;
  message: String;
}

contract TestContract {
  outer: Outer;

  init() {
    self.outer = Outer{
      intVal: 1,
      nested: Inner{
        boolVal: true,
        message: "hi"
      }
    };
  }
}