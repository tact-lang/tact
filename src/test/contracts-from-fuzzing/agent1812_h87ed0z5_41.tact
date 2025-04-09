// Intentionally create a struct with very long list of mixed fields (edge test)
struct UltraLong {
  a1: Int; a2: Bool; a3: String; a4: Int?; a5: Bool?; a6: String?;
  b1: Int; b2: Bool; b3: String; b4: Int?; b5: Bool?; b6: String?;
  c1: Int; c2: Bool; c3: String; c4: Int?; c5: Bool?; c6: String?;
  d1: Int; d2: Bool; d3: String; d4: Int?; d5: Bool?; d6: String?;
}

contract UltraLongFields {
  data: UltraLong;

  init() {
    self.data = UltraLong{
      a1:1, a2:true, a3:"a", a4:null, a5:null, a6:null,
      b1:2, b2:false, b3:"b", b4:null, b5:null, b6:null,
      c1:3, c2:true, c3:"c", c4:null, c5:null, c6:null,
      d1:4, d2:false, d3:"d", d4:null, d5:null, d6:null
    };
  }
}