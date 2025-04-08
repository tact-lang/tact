struct A1 { f: Int; }
struct A2 { f: Int; }
struct A3 { f: Int; }
struct A4 { f: Int; }
struct A5 { f: Int; }
struct A6 { f: Int; }

struct BigNest {
  a1: A1;
  a2: A2;
  a3: A3;
  a4: A4;
  a5: A5;
  a6: A6;
}

contract DeepStruct {
    s: BigNest;

    init() {
        self.s = BigNest{
            a1: A1{f:1},
            a2: A2{f:2},
            a3: A3{f:3},
            a4: A4{f:4},
            a5: A5{f:5},
            a6: A6{f:6},
        };
    }
}