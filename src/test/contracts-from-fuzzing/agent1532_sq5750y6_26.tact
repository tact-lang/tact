struct S {
  x: Int; y: Int?; z: Int; w: Int?;
}

contract OptionalAlternating {
  s1: S; s2: S; s3: S; s4: S;

  init() {
    self.s1=S{x:1,y:null,z:2,w:3};
    self.s2=S{x:4,y:5,z:6,w:null};
    self.s3=S{x:7,y:8,z:9,w:10};
    self.s4=S{x:11,y:null,z:12,w:13};
  }
}