struct DeepNest {
  a: Int;
  b: String;
  c: Bool;
}

struct MidNest {
  inner: DeepNest;
  flag: Bool;
  text: String;
}

struct TopStruct {
  middle: MidNest;
  count: Int;
  note: String;
  status: Bool;
}

contract DeepContract {
  info: TopStruct;

  init() {
    self.info = TopStruct{
      middle: MidNest{
        inner: DeepNest{
          a: 5,
          b: "deep",
          c: true
        },
        flag: false,
        text: "middle"
      },
      count: 42,
      note: "top",
      status: true
    };
  }
}
