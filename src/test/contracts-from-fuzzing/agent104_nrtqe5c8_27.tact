struct SOptInSOpt {
  alpha: Int?;
}

struct SWrap {
  wrapped: SOptInSOpt?;
}

contract OptWrapTest {
  data: SWrap;
  init() {
    self.data = SWrap { wrapped: null };
  }
}