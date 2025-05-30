struct A { num: Int; s: String; }
struct B { innerA: A; flag: Bool; text: String; }
contract NestingTest {
  big: B;
  init() {
    self.big = B{innerA: A{num: 7, s: "x"}, flag: false, text: "hi"};
  }
}
