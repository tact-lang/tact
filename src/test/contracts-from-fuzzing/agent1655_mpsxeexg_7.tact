struct OptFields {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

contract OptTest {
  data: OptFields;

  init() {
    self.data = OptFields{
      a:null,
      b:true,
      c:null,
      d:null
    };
  }
}