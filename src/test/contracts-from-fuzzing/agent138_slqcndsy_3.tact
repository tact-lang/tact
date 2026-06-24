struct S0 { a: Int }
struct S1 { b: S0 }
struct S2 { c: S1 }
struct S3 { d: S2 }
struct S4 { e: S3 }
struct S5 { f: S4 }
struct S6 { g: S5 }
contract Test {
  val: S6;
  init() {
    self.val = S6{ g: S5{ f: S4{ e: S3{ d: S2{ c: S1{ b: S0{ a: 1 }}}}}}};
  }
}