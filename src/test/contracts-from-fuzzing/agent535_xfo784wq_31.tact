struct S1 { val: Int }
struct S2 { val: S1 }
struct S3 { val: S2 }
struct S4 { val: S3 }
struct S5 { val: S4 }
struct S6 { val: S5 }
struct S7 { val: S6 }
struct S8 { val: S7 }
struct S9 { val: S8 }
struct S10 { val: S9 }

contract SuperDeep {
  s: S10;

  init() {
    self.s = S10{ val: S9{ val: S8{ val: S7{ val: S6{ val: S5{ val: S4{ val: S3{ val: S2{ val: S1{ val: 555 }}}}}}}}}};
  }
}