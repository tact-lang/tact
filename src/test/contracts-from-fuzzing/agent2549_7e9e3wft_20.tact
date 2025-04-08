struct Deep {
  val: Int;
}

struct Mid {
  d1: Deep; d2: Deep; d3: Deep; d4: Deep; d5: Deep; d6: Deep; d7: Deep; d8: Deep; d9: Deep; d10: Deep;
}

contract WideNested {
  storage: Mid;

  init() {
    self.storage = Mid{
      d1: Deep{val:1}, d2: Deep{val:2}, d3: Deep{val:3}, d4: Deep{val:4}, d5: Deep{val:5}, 
      d6: Deep{val:6}, d7: Deep{val:7}, d8: Deep{val:8}, d9: Deep{val:9}, d10: Deep{val:10},
    };
  }
}