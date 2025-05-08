struct OptionalNested {
  inner: InnerOpt?;
}

struct InnerOpt {
  flag: Bool;
  value: Int?;
}

contract TestOptNest {
  data: OptionalNested;
  
  init() {
    self.data = OptionalNested {
      inner: null
    };
  }
  
  receive() {
    if (self.data.inner != null) {
      let _ = self.data.inner!!.value;
    }
  }
}