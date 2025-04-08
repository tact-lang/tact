struct S1 {
  val: Int;
}
struct S2 {
  val: Bool;
}
struct S3 {
  val: String;
}
struct S4 {
  val: Cell;
}
struct S5 {
  val: Slice;
}

struct Combined {
  s1: S1;
  s2: S2;
  s3: S3;
  s4: S4;
  s5: S5;
  optInt: Int?;
  optBool: Bool?;
}

contract TestContract {
  persist: Combined;

  init() {
    self.persist = Combined{
      s1: S1{val:1},
      s2: S2{val:true},
      s3: S3{val:"hi"},
      s4: S4{val:emptyCell()},
      s5: S5{val:emptyCell().asSlice()},
      optInt:null,
      optBool:null
    };
  }
}