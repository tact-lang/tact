struct Deep5 {
  val: Int;
  flag: Bool;
}

struct Deep4 {
  d5: Deep5;
}

struct Deep3 {
  d4: Deep4;
}

struct Deep2 {
  d3: Deep3;
}

struct Deep1 {
  d2: Deep2;
}

contract DeepNest5 {
  data: Deep1;

  init() {
    self.data = Deep1{
      d2: Deep2{
        d3: Deep3{
          d4: Deep4{
            d5: Deep5{ val: 100, flag: true }
          }
        }
      }
    };
  }
}
