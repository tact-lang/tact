// deep nested optional inside struct with init assignment
struct DeepWrap {
  x: Int?;
}

struct MiddleWrap {
  dw: DeepWrap;
}

contract DeepOptAssign {
  m: MiddleWrap;
  init() {
    self.m = MiddleWrap{ dw: DeepWrap{ x: null } };
  }
}