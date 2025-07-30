// Large repeating nesting chain
struct S1{ a:Int=1; }
struct S2{ a:S1; }
struct S3{ a:S2; }
struct S4{ a:S3; }
struct S5{ a:S4; }
struct S6{ a:S5; }

contract Test {
  s:S6;
  init(){
    self.s = S6{ a:S5{ a:S4{ a:S3{ a:S2{ a:S1{ a:1 } } } } } };
  }
}