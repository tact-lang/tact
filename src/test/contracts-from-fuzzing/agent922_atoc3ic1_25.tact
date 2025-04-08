struct S {
  a: Int; b: Bool; c: Int?; d: Bool?; e: String?;
}

contract T {
  s1:S; s2:S; s3:S; s4:S; s5:S;

  init() {
    self.s1 = S {a:1,b:true,c:null,d:true,e:null};
    self.s2 = S {a:2,b:false,c:3,d:null,e:"x"};
    self.s3 = S {a:4,b:true,c:null,d:false,e:"y"};
    self.s4 = S {a:5,b:false,c:6,d:true,e:null};
    self.s5 = S {a:7,b:true,c:null,d:null,e:"z"};
  }
}