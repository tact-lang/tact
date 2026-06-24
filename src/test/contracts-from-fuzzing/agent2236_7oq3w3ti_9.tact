struct Wide {
  a: Int; b: Int; c: Int; d: Int; e: Int;
  f: Bool; g: String; h: Bool?; i: String?; j: Bool;
}

contract WideStructHolder {
  val: Wide;

  init() {
    self.val = Wide{
      a:1, b:2, c:3, d:4, e:5,
      f:true, g:"hi", h:null, i:null, j:false
    };
  }
}