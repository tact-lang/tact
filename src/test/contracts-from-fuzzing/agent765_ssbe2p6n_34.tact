struct BigNested {
  s1: Small;
  s2: Small;
  s3: Small;
}

struct Small {
  a: Int;
  b: Bool;
  c: String;
}

contract ComplexStorage {
  field: BigNested;
  init() {
    self.field = BigNested{
      s1: Small{a:1,b:true,c:"x"},
      s2: Small{a:2,b:false,c:"y"},
      s3: Small{a:3,b:true,c:"z"}
    };
  }
}