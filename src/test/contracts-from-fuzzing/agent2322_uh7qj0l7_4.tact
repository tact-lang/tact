struct OptStruct1 { foo: Int?; }
struct OptStruct2 { bar: OptStruct1?; }

contract OptNest {
  data: OptStruct2 = OptStruct2{
    bar: OptStruct1{ foo: null }
  };

  init() {}
}
