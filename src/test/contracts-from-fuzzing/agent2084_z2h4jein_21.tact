struct Struct1 {
  x: Int;
}

struct Struct2 {
  y: Bool;
}

struct Struct3 {
  z: String;
}

contract Test {
  s1: Struct1;
  s2: Struct2;
  s3: Struct3;
  init() {
    self.s1 = Struct1{x:1};
    self.s2 = Struct2{y:true};
    self.s3 = Struct3{z:"z"};
  }
}