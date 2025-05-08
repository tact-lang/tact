struct ManyNest {
  l1: Int;
  l2: Int;
  l3: Int;
  l4: Int;
  l5: Int;
  l6: Int;
  l7: Int;
  l8: Int;
  l9: Int;
  l10: Int;
}

struct TopMost {
  a: ManyNest;
  b: ManyNest;
  c: ManyNest;
}

contract MultiLayer {
  data: TopMost;

  init() {
    self.data = TopMost{
      a: ManyNest{l1:1,l2:2,l3:3,l4:4,l5:5,l6:6,l7:7,l8:8,l9:9,l10:10},
      b: ManyNest{l1:11,l2:12,l3:13,l4:14,l5:15,l6:16,l7:17,l8:18,l9:19,l10:20},
      c: ManyNest{l1:21,l2:22,l3:23,l4:24,l5:25,l6:26,l7:27,l8:28,l9:29,l10:30}
    };
  }
}