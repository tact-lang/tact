struct S1 { x: Int }
struct S2 { y: Bool }
struct S3 { s1: S1; s2: S2 }

contract Combination {
  combined: S3;
  
  init() {
    self.combined = S3{ s1: S1{x: 42}, s2: S2{y:true} };
  }
}