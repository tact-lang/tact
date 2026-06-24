// test contract with HUGE optional chain, optional of optional of optional (struct-wise)

struct S1 { s: String?; }
struct S2 { s1: S1?; }
struct S3 { s2: S2?; }
struct S4 { s3: S3?; }
struct S5 { s4: S4?; }
struct S6 { s5: S5?; }
struct S7 { s6: S6?; }

contract OptTower {
  payload: S7;

  init() {
    self.payload = S7{ s6:S6{ s5:S5{ s4:S4{ s3:S3{ s2:S2{ s1:S1{s:null} } } } } } };
  }
}