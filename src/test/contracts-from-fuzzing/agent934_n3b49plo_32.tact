struct S0 { val: Int }
struct S1 { val: S0 }
struct S2 { val: S1 }
struct S3 { val: S2 }
struct S4 { val: S3 }

contract Chain {
  data: S4;
  init() {
    self.data = S4{ val: S3{ val: S2{ val: S1{ val: S0{ val: 42 } } } } };
  }
}