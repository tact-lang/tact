struct InnerStruct {
  foo: Int = 5;
  bar: Bool;
}

struct OuterStruct {
  inner: InnerStruct;
  extra: String?
}

contract TestContract {
  val: OuterStruct;
  init() {
    self.val = OuterStruct{inner: InnerStruct{bar: true}, extra: null};
  }
}