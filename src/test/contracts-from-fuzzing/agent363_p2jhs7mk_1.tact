struct NestedStruct {
  a: Int;
  b: Bool;
  s: InnerStruct;
}

struct InnerStruct {
  x: Int;
  y: String;
}

contract TestContract {
  val: NestedStruct;

  init() {
    self.val = NestedStruct{
      a: 5,
      b: true,
      s: InnerStruct{
        x: 10,
        y: "hi"
      }
    };
  }
}