struct Leaf {
  text: String?;
  num: Int?;
}

struct Deep3 { leaf: Leaf; }
struct Deep2 { d3: Deep3; }
struct Deep1 { d2: Deep2; }

contract DeepOptMixedEnd {
  data: Deep1;

  init() {
    self.data = Deep1 {
      d2: Deep2 {
        d3: Deep3 {
          leaf: Leaf {
            text: null,
            num: null
          }
        }
      }
    };
  }
}