struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }
struct S4 { d: Slice }
struct S5 { e: Address }

struct Combo {
  s1: S1;
  s2: S2;
  s3: S3;
  s4: S4;
  s5: S5;
}

contract ComboStore {
  val: Combo;

  init() {
    self.val = Combo{
      s1: S1{ a: 1 },
      s2: S2{ b: false },
      s3: S3{ c: "test" },
      s4: S4{ d: emptyCell().asSlice() },
      s5: S5{ e: myAddress() }
    };
  }
}