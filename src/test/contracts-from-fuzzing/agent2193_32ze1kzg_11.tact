struct OptionalStruct {
  data: String?;
}

struct Wrapper {
  inner: OptionalStruct?;
  number: Int;
}

contract TestContract {
  stored: Wrapper;

  init() {
    self.stored = Wrapper{
      inner: null,
      number: 42
    };
  }
}