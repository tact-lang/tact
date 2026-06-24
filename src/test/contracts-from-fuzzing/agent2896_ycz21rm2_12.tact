struct SubSub {
  foo: Int;
}
struct Sub {
  nested: SubSub;
}
contract DoubleNestedStruct {
  val: Sub;

  init() {
    self.val = Sub{
      nested: SubSub{ foo: 123 },
    };
  }
}