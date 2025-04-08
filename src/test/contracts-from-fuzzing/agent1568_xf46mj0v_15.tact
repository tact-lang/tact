struct Sub {
  a: Int;
}

struct Mid {
  s: Sub;
  opt: Int?;
}

struct Out {
  m: Mid;
  txt: String;
}

contract OptionalDeepSet {
  data: Out;

  init() {
    self.data = Out{
      m: Mid{
        s: Sub{a:42},
        opt: null,
      },
      txt: "ok",
    };
  }
}