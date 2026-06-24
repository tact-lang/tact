struct WrappedOptional {
  inner: Int?;
}

contract OptInStruct {
  val: WrappedOptional = WrappedOptional{ inner: null };

  init() {
    self.val = WrappedOptional{ inner: 42 };
  }
}
