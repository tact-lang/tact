struct NestedStruct {
  foo: Int;
}

struct MainData {
  bar: Int;
  nestedOpt: NestedStruct?;
  flag: Bool;
}

contract NestedOptTest {
  data: MainData;

  init() {
    self.data = MainData{
      bar: 123,
      nestedOpt: null,
      flag: true
    };
  }
}
