struct S1 { f1: Int; f2: Bool; f3: String; }
struct S2 { s: S1; flag: Bool?; txt: String; }
struct S3 { s2: S2; val: Int; }

contract NestedOptional {
  storage: S3;

  init() {
    self.storage = S3{
      s2: S2{
        s: S1{
          f1: 5,
          f2: true,
          f3: "foo"
        },
        flag: null,
        txt: "bar"
      },
      val: 99
    };
  }
}