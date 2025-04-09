struct InnerMost {
  flag: Bool;
  s: String;
}

struct MiddleOpt {
  inner: InnerMost?;
  count: Int;
}

struct TopOpt {
  mid: MiddleOpt;
  finalText: String;
}

contract NestedNulls {
  data: TopOpt;
  init() {
    self.data = TopOpt{
      mid: MiddleOpt{
        inner: null,
        count: 0
      },
      finalText: "done"
    };
  }
}