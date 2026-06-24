struct InnerMost {
  val: Int;
}

struct Middle1 {
  inner: InnerMost;
}

struct Middle2 {
  middle1: Middle1;
}

struct Middle3 {
  middle2: Middle2;
}

struct Middle4 {
  middle3: Middle3;
}

contract DeepChain {
  data: Middle4;
  init() {
    self.data = Middle4{
      middle3: Middle3{
        middle2: Middle2{
          middle1: Middle1{
            inner: InnerMost{val: 42}
          }
        }
      }
    };
  }
}