// Large nested optional struct
struct Top {
  n1: N?;
  n2: N?;
  n3: N?;
}

struct N {
  i: Int;
  s: String?;
}

contract MultiOptNest {
  data: Top;

  init() {
    self.data = Top{
      n1: null,
      n2: N{i:2,s:null},
      n3: null
    };
  }
}