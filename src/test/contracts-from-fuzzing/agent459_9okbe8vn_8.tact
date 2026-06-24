struct OptionInNested {
  val: Int?;
}
struct Outer {
  inner: OptionInNested;
  other: Bool;
}
contract OptInNestedTest {
  o: Outer;

  init() {
    self.o = Outer{
      inner: OptionInNested{ val: null },
      other: true
    };
  }
}