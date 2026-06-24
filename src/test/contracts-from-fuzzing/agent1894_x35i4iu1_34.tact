struct ABC {
 a: Int;
 b: Bool;
 c: String;
}

contract MultipleStructs {
  s1: ABC;
  s2: ABC;
  s3: ABC;

  init() {
    self.s1 = ABC{ a:1,b:true,c:"x" };
    self.s2 = ABC{ a:2,b:false,c:"y" };
    self.s3 = ABC{ a:3,b:true,c:"z" };
  }
}