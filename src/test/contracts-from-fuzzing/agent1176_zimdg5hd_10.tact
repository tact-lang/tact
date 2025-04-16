struct WideStruct {
  i1: Int; i2: Int; i3: Int; i4: Int; i5: Int;
  b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
  s1: String; s2: String; s3: String; s4: String; s5: String;
  a1: Address?; a2: Address?; a3: Address?; a4: Address?; a5: Address?;
}

contract WideFields {
  data: WideStruct;

  init() {
    self.data = WideStruct{
      i1: 1, i2: 2, i3: 3, i4: 4, i5: 5,
      b1: false, b2: true, b3: false, b4: true, b5: false,
      s1: "a", s2: "b", s3: "c", s4: "d", s5: "e",
      a1: null, a2: null, a3: null, a4: null, a5: null
    };
  }
}