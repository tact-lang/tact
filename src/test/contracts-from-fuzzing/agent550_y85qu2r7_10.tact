struct OptionFieldTest {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Slice?;
  e: Cell?;
  f: Address?;
}

contract OptFields {
    field: OptionFieldTest;

    init() {
        self.field = OptionFieldTest{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}