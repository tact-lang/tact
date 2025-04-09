struct OptionalWrap {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Address?;
}

contract OptionalStore {
  state: OptionalWrap;

  init() {
    self.state = OptionalWrap{
      a:null, b:true, c:"qq", d:null, e:null
    };
  }
}
