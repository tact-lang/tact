struct DeeplyNestedOptional {
  a: Int?;
  b: String?;
}

struct MidLevel {
  nest: DeeplyNestedOptional?;
  extra: Bool;
}

struct TopLevel {
  mid: MidLevel;
  text: String;
}

contract DeepOptContract {
  data: TopLevel;
  init() {
    self.data = TopLevel{
      mid: MidLevel{
        nest: null,
        extra: false
      },
      text: "done"
    };
  }
}