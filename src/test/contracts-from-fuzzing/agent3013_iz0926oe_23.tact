struct HasManyPrimitives {
  intf: Int;
  boolf: Bool;
  stringf: String;
}

contract WrappingStruct {
  field: HasManyPrimitives;

  init() {
    self.field = HasManyPrimitives{
      intf: 5,
      boolf: true,
      stringf: "abc"
    };
  }
}
