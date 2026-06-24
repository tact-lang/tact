struct InnerOptional {
  x: Int?;
  y: Bool?;
}

struct OuterOptional {
  inner: InnerOptional?;
}

contract OptionalInStructs {
  field: OuterOptional;

  init() {
    self.field = OuterOptional{
      inner: null
    };
  }

  receive() {
    if (self.field.inner != null) {
      let _ = self.field.inner!!.x;
    }
  }
}
