struct S1 {
  a: Int;
  b: Bool;
}

struct S2 {
  nested: S1;
  c: String;
  d: Bool;
}

struct S3 {
  nested2: S2;
  e: Int;
}

contract Test {
  field: S3;

  init() {
    self.field = S3{
      nested2: S2{
        nested: S1{ a:1, b:true },
        c:"s",
        d:false
      },
      e: 42
    };
  }
}