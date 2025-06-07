struct CustomSer {
  foo: Int as int8;
  bar: Int as uint32;
  flag: Bool;
}

contract CustomSerContract {
  data: CustomSer;

  init() {
    self.data = CustomSer{
      foo: -5,
      bar: 50,
      flag: true,
    };
  }
}