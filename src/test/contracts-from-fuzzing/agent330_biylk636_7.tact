struct Small {
  one: Int;
  two: Int;
}

contract DeepChain {
  lv1: Small;
  lv2: Small;
  lv3: Small;
  lv4: Small;
  lv5: Small;

  init() {
    self.lv1 = Small{one:1, two:2};
    self.lv2 = Small{one:2, two:4};
    self.lv3 = Small{one:3, two:6};
    self.lv4 = Small{one:4, two:8};
    self.lv5 = Small{one:5, two:10};
  }
}
