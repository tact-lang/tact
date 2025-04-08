struct S1 { a: Int }
struct S2 { b: Int }
struct S3 { c: Int }
struct S4 { d: Int }
struct S5 { e: Int }
struct S6 { f: Int }
struct S7 { g: Int }
struct S8 { h: Int }
struct S9 { i: Int }
struct S10 { j: Int }

struct ManyNested {
  s1: S1;
  s2: S2;
  s3: S3;
  s4: S4;
  s5: S5;
  s6: S6;
  s7: S7;
  s8: S8;
  s9: S9;
  s10: S10;
}

contract LotsOfFields {
  data: ManyNested;

  init() {
    self.data = ManyNested{
      s1: S1{a:1},
      s2: S2{b:2},
      s3: S3{c:3},
      s4: S4{d:4},
      s5: S5{e:5},
      s6: S6{f:6},
      s7: S7{g:7},
      s8: S8{h:8},
      s9: S9{i:9},
      s10: S10{j:10},
    };
  }
}