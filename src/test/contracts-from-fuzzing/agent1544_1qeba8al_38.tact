struct BigOptional {
  a: Int?; b: Bool?; c: String?; d: Address?; e: Cell?;
  f: Int?; g: Bool?; h: String?; i: Address?; j: Cell?;
}

contract BigOptionalHolder {
  val: BigOptional;

  init() {
    self.val = BigOptional{
      a:null, b:null, c:null, d:null, e:null,
      f:null, g:null, h:null, i:null, j:null
    };
  }
}
