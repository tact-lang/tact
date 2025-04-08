struct Embedded {
  i: Int;
}

contract ManyEmbedded {
  e1: Embedded; e2: Embedded; e3: Embedded;
  e4: Embedded; e5: Embedded; e6: Embedded;

  init() {
    self.e1=Embedded{i:1};
    self.e2=Embedded{i:2};
    self.e3=Embedded{i:3};
    self.e4=Embedded{i:4};
    self.e5=Embedded{i:5};
    self.e6=Embedded{i:6};
  }
}