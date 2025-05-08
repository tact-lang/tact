struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: Address }
struct S4 { d: Cell }
struct S5 { e: String }

struct Container {
  s1: S1;
  s2: S2;
  s3: S3;
  s4: S4;
  s5: S5;
}

contract TestManyNestedStructs {
  data: Container;

  init() {
    self.data = Container{
      s1: S1{a:1},
      s2: S2{b:true},
      s3: S3{c:myAddress()},
      s4: S4{d:emptyCell()},
      s5: S5{e:"test"}
    };
  }
}