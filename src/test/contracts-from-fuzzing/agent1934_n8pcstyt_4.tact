struct Deep1 {
  v1: Int;
  v2: Bool?;
}

struct Deep2 {
  d1: Deep1;
  v3: Bool;
}

struct Deep3 {
  d2: Deep2;
  v4: Int;
}

contract Multilayer {
  state: Deep3;

  init() {
    self.state = Deep3{
      d2: Deep2{
        d1: Deep1{
          v1: 10,
          v2: null,
        },
        v3: true,
      },
      v4: 777,
    };
  }
}
