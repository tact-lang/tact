struct S1{ a:Int; }
struct S2{ s:S1; }
struct S3{ s:S2; }
struct S4{ s:S3; }
struct S5{ s:S4; }
struct S6{ s:S5; }
struct S7{ s:S6; }
struct S8{ s:S7; }
struct S9{ s:S8; }
struct S10{ s:S9; }

contract DeepTen {
  s: S10;

  init() {
    self.s = S10{ s: S9{ s:S8{ s:S7{ s:S6{ s:S5{ s:S4{ s:S3{ s:S2{ s:S1{a:42} }}}}}}}}};
  }
}