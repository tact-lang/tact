struct ManyFields {
  f1: Int = 1;
  f2: Int = 2;
  f3: Int = 3;
  f4: Int = 4;
  f5: Int = 5;
  f6: Int = 6;
  f7: Int = 7;
  f8: Int = 8;
  f9: Int = 9;
  f10: Int = 10;
}

contract Test {
  val: ManyFields = ManyFields{
    f1: 1,
    f2: 2,
    f3: 3,
    f4: 4,
    f5: 5,
    f6: 6,
    f7: 7,
    f8: 8,
    f9: 9,
    f10: 10
  };

  init() {}
}