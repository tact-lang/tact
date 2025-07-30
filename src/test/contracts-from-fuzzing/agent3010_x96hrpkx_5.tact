struct InnerStruct1 { a: Int; }
struct InnerStruct2 { b: Bool; }
struct InnerStruct3 { c: String; }

struct Combo {
  s1: InnerStruct1;
  s2: InnerStruct2;
  s3: InnerStruct3;
}

contract Diverse {
  combo: Combo;

  init() {
    self.combo = Combo{
      s1: InnerStruct1{ a: 42 },
      s2: InnerStruct2{ b: false },
      s3: InnerStruct3{ c: "hi" }
    };
  }
}
