// optional persistent entire struct
struct SimpleStruct {
  a: Int;
  b: Bool;
}

contract OptionalWholeStruct {
  data: SimpleStruct?;

  init() {
    self.data = SimpleStruct{ a: 5, b: true };
  }
}
