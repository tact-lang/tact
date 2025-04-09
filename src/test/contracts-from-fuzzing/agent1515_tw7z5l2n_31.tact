struct OptMix {
  o1: Int? = null;
  o2: Int? = 5;
  o3: Int? = null;
}

contract OptMixTest {
  data: OptMix;

  init() {
    self.data = OptMix{ o1: null, o2: 100, o3: null };
  }

  receive() { dump(self.data.o2); }
}