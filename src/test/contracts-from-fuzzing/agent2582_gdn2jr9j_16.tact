struct Deep {
  lv1: Int;
  lv2: Int;
  lv3: Int;
  lv4: Int;
  lv5: Int;
  lv6: Int;
  lv7: Int;
  lv8: Int;
  lv9: Int;
  lv10: Int;
}

contract Test {
  val: Deep;

  init() {
    self.val = Deep{
      lv1:1,lv2:2,lv3:3,lv4:4,lv5:5,lv6:6,lv7:7,lv8:8,lv9:9,lv10:10
    };
  }
}
