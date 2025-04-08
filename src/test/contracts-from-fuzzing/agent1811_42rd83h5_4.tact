struct OptionalFields {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
}

contract TestOptionalFields {
  state: OptionalFields;

  init() {
    self.state = OptionalFields{
      a:null, b:true, c:null, d:null
    };
  }
}
