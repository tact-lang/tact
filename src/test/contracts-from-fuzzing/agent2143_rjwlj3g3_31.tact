struct StructWithStruct {
  nested: SubStruct;
}

struct SubStruct {
  foo: Int;
  bar: Bool;
}

contract StructWithinStruct {
  data: StructWithStruct;

  init() {
    self.data = StructWithStruct{nested: SubStruct{foo: 5, bar: true}};
  }
}