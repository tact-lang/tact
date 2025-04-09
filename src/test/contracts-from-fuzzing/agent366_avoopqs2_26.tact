struct FinalLevel {
  val: Int;
}

struct MiddleLevel {
  next: FinalLevel;
  optStr: String?;
}

struct TopLevel {
  mid: MiddleLevel;
  flag: Bool?;
}

contract ComboDeepOptional {
  data: TopLevel;
  init() {
    self.data = TopLevel{
      mid: MiddleLevel{
        next: FinalLevel{ val: 888 },
        optStr: null
      },
      flag: null
    };
  }
}