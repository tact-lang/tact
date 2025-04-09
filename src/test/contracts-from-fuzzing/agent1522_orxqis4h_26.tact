struct Bar {
  x: Int;
  y: Bool;
}

struct ContainOptStruct {
  foo: Bar?;
  n: Int;
}

contract OptionalStructField {
  data: ContainOptStruct;

  init() {
    self.data = ContainOptStruct{
      foo: null,
      n: 5,
    };
  }

  receive() {
    let _ = self.data;
  }
}