// Testing very deep nesting (10 levels)
struct S1 { a: Int }
struct S2 { x: S1 }
struct S3 { x: S2 }
struct S4 { x: S3 }
struct S5 { x: S4 }
struct S6 { x: S5 }
struct S7 { x: S6 }
struct S8 { x: S7 }
struct S9 { x: S8 }
struct S10 { x: S9 }

contract TenDeep {
  d: S10;
  init() {
    self.d = S10{ x: S9{ x: S8{ x: S7{ x: S6{ x: S5{ x: S4{ x: S3{ x: S2{ x: S1{ a: 1 } } } } } } } } } };
  }
}