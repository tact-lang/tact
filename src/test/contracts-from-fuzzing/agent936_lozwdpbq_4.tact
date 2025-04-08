struct NestedOptionalStruct {
  inner: Inner?;
}

struct Inner {
  flag: Bool;
}

contract TestContract {
  data: NestedOptionalStruct?;

  init() {
    self.data = NestedOptionalStruct{
      inner: Inner{
        flag: true,
      },
    };
  }
}
