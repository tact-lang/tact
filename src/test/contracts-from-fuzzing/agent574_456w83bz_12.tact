// nested struct with optionals defaulted implicitly
struct OptStruct {
  a: Int?;
  b: String?;
}

contract NestedImplicitNull {
  data: OptStruct;

  init() {
    self.data = OptStruct{
      a: null,
      b: null
    };
  }
}