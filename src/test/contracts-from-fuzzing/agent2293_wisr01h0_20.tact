struct S {
  a: Int; b: Bool; c: Int?; d: Bool?; e: String; f: String?; g: Address; h: Address?;
}

contract Combo {
  x: S;

  init(addr: Address) {
    self.x = S{ a:1, b:false, c:null, d:null, e:"", f:null, g:addr, h:null };
  }
}