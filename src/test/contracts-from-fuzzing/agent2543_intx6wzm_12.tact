struct S1 { a: Int; b: String; c: Bool; }
struct S2 { s1: S1; d: Bool; e: String; }
struct S3 { s2: S2; f: Int; g: String?; }

contract NestedOption {
  data: S3;
  init() {
    self.data = S3{
      s2: S2{
        s1: S1{ a:1, b:"hi", c:true },
        d: false,
        e: "bye"
      },
      f: 100,
      g: null
    };
  }
}