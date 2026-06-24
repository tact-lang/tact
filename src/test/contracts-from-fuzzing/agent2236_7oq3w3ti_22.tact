struct CombineOpt {
  a: Int?;
  b: Bool?;
}

struct Combine {
  c: CombineOpt;
  name: String;
}

contract OptionalCombine {
  data: Combine;

  init() {
    self.data = Combine{
      c: CombineOpt{ a: null, b: null },
      name: "abc"
    };
  }
}