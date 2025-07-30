// test very deeply nested optional in struct within struct
struct S1 { x: Int?; }
struct S2 { s: S1?; }
struct S3 { s: S2?; }
struct S4 { s: S3?; }
struct S5 { s: S4?; }
struct S6 { s: S5?; }

contract TestContract {
  val: S6;

  init() {
    self.val = S6{s: null};
  }
}