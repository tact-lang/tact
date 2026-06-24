// Struct with very long list of many primitive fields
struct ManyPrims {
  a1: Int;
  a2: Int;
  a3: Int;
  a4: Int;
  a5: Int;
  b1: Bool;
  b2: Bool;
  s1: String;
  s2: String;
  s3: String;
  addr1: Address;
  addr2: Address;
  c1: Cell;
  sl1: Slice;
  opt1: Int?;
  opt2: Bool?;
  opt3: String?;
  opt4: Address?;
  opt5: Cell?;
}

contract LotOfFields {
  data: ManyPrims;

  init() {
    self.data = ManyPrims{
      a1: 1, a2:2, a3:3, a4:4, a5:5,
      b1:true, b2:false,
      s1:"x", s2:"y", s3:"z",
      addr1: myAddress(), addr2: myAddress(),
      c1: emptyCell(),
      sl1: emptyCell().asSlice(),
      opt1: null, opt2: true,
      opt3: null, opt4: null, opt5: null,
    };
  }
}