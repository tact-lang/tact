struct S1 {a:Int}
struct S2 {b:Int}
struct Both {s1:S1; s2:S2}

contract MultiStructs {
  val: Both;

  init() {
    self.val=Both{s1:S1{a:7},s2:S2{b:8}};
  }
}