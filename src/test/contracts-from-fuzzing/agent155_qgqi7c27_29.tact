struct Rec1 {
  a: Rec2;
  i: Int;
}

struct Rec2 {
  b: Rec3;
  j: Int;
}

struct Rec3 {
  k: Int;
}

contract Cascade {
    val: Rec1;
    init() {
        self.val = Rec1{a: Rec2{b: Rec3{k: 555}, j: 66}, i: 77};
    }
}