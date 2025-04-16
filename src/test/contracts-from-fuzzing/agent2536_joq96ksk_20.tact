// deep nested optional fields, partially initialized
struct Deep {
  d1: Int?;
  d2: Int?;
}

struct Mid {
  m1: Deep?;
  m2: Deep?;
}

contract NestedPartially {
  m: Mid;

  init() {
    self.m = Mid{ m1: null, m2: null };
  }
}