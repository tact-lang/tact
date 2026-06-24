struct Rec1 {
  f1: Int;
}
struct Rec2 {
  f2: Rec1;
}
struct Rec3 {
  f3: Rec2;
}
struct Rec4 {
  f4: Rec3;
}
struct Rec5 {
  f5: Rec4;
}
struct Rec6 {
  f6: Rec5;
}
struct Rec7 {
  f7: Rec6;
}

contract DeepRecursion7 {
  cell: Rec7;

  init() {
    self.cell = Rec7{
      f7: Rec6{
        f6: Rec5{
          f5: Rec4{
            f4: Rec3{
              f3: Rec2{
                f2: Rec1{f1: 77}
              }
            }
          }
        }
      }
    };
  }
}
