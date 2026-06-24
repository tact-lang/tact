struct Deep {
  n1: Int;
  n2: Int;
  n3: Int;
  n4: Int;
  n5: Int;
  n6: Int;
  n7: Int;
  n8: Int;
  n9: Int;
  n10: Int;
}

contract DeepFields {
  d: Deep;

  init() {
    self.d = Deep{ n1:1,n2:2,n3:3,n4:4,n5:5,n6:6,n7:7,n8:8,n9:9,n10:10 };
  }
}