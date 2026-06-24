// Optionals wrapping nested structs with some fields filled
struct InnerData {
  num: Int?;
  flag: Bool?;
}

struct TopWrap {
  data: InnerData?;
  count: Int;
}

contract OptWrap {
  t: TopWrap;
  init() {
    self.t = TopWrap {
      data: InnerData { num: 1, flag: null },
      count: 99
    };
  }
}