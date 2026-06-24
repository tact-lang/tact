struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }
struct S4 { d: Address?; }
struct S5 { e: Slice; }

contract WideStructs {
  f1: S1;
  f2: S2;
  f3: S3;
  f4: S4;
  f5: S5;

  init() {
    self.f1 = S1{ a: 1 };
    self.f2 = S2{ b: false };
    self.f3 = S3{ c: "hi" };
    self.f4 = S4{ d: null };
    self.f5 = S5{ e: emptyCell().asSlice() };
  }
}
