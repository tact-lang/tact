struct SDeepOpt {
  ss: SInner?;
}

struct SInner {
  sss: SInner2?;
}

struct SInner2 {
  x: Int?;
}

contract NestedOptionalFields {
  val: SDeepOpt;
  init() {
    self.val = SDeepOpt{
      ss: SInner{
        sss: SInner2{
          x: null
        }
      }
    };
  }
}