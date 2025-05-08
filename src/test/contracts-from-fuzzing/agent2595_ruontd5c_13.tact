// nested optional fields forbidden, but optional struct OptionalB is fine
struct OptionalB {
  f: Int?;
}

struct TopStruct {
  f1: Int; 
  f2: OptionalB?;
}

contract OptionalNestedStruct {
  val: TopStruct;

  init() {
    self.val = TopStruct{
      f1: 42,
      f2: null
    };
  }
}