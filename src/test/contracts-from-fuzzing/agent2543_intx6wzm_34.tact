struct SubLevel {
  val: Int;
  str: String;
}

struct MidLevel {
  s: SubLevel;
  optInt: Int?;
  optStr: String?;
}

contract Combo2 {
  data: MidLevel;
  init() {
    self.data = MidLevel{
      s: SubLevel{ val:4, str:"text" },
      optInt: null,
      optStr: null
    };
  }
}