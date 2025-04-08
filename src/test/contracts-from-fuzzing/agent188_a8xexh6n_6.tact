struct U {
  flag: Bool;
}

struct V {
  inner: U;
}

struct W {
  inner: V;
}

contract VeryDeeplyNested {
  data: W;

  init() {
    self.data = W {
      inner: V {
        inner: U {
          flag: true
        }
      }
    };
  }
}