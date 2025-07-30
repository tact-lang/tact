struct ManyPrim {
  s1: String; s2: String; s3: String;
  b1: Bool; b2: Bool; b3: Bool;
  i1: Int; i2: Int; i3: Int;
}

contract MassPrimitives {
  p: ManyPrim;
  init() {
    self.p = ManyPrim{
      s1:"a",s2:"b",s3:"c", b1:true,b2:false,b3:true, i1:1,i2:2,i3:3
    };
  }
}