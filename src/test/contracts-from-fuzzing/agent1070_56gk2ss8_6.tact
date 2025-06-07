struct Inner {
  f1: Int;
}

struct Middle1 {
  f2: Inner;
}

struct Middle2 {
  f3: Middle1;
}

struct Middle3 {
  f4: Middle2;
}

contract DeepDeepContract {
  data: Middle3;

  init() {
    self.data = Middle3{
      f4: Middle2{
        f3: Middle1{
          f2: Inner{
            f1: 99
          }
        }
      }
    };
  }
}