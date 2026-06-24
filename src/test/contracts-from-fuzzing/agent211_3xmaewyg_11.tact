struct Deep1 { val: Int; }
struct Deep2 { d: Deep1; }
struct Deep3 { e: Deep2; }
contract DeepNested4 {
  nest: Deep3;
  init() {
    self.nest = Deep3{
      e: Deep2{
        d: Deep1{
          val: 44
        }
      }
    };
  }
}
