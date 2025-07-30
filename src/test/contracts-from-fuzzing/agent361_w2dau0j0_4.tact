struct L1 {
  f1: Int;
}

struct L2 {
  f2: L1;
}

struct L3 {
  f3: L2;
}

struct L4 {
  f4: L3;
}

struct L5 {
  f5: L4;
}

contract FiveLevelsDeep {
  data: L5;

  init() {
    self.data = L5{
      f5: L4{
        f4: L3{
          f3: L2{
            f2: L1{ f1: 123 },
          },
        },
      },
    };
  }
}
