struct Base1 {
  a: Int;
  b: Bool;
}

struct Base2 {
  c: Int?;
  d: Bool?;
}

struct Base3 {
  e: String;
  f: String?;
}

struct Compose {
  s1: Base1;
  s2: Base2;
  s3: Base3;
}

contract NestedComposedStructsTest {
  field: Compose;

  init() {
    self.field = Compose{
      s1: Base1{a:1,b:true},
      s2: Base2{c:null,d:false},
      s3: Base3{e:"hi",f:null}
    };
  }
}