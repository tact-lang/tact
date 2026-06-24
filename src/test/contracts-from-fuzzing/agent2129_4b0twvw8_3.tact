struct S1 { a: Int; }
struct S2 { s1: S1; val: Bool; }
struct S3 { s2: S2; note: String; }

contract DeepNest {
  field: S3;

  init() {
    self.field = S3{
      s2: S2{
        s1: S1{ a: 1 },
        val: false,
      },
      note: "hello",
    };
  }
}