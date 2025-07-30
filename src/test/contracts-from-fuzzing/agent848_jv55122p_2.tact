struct NestedLvl3 {
  deep: Int;
}

struct NestedLvl2 {
  inner: NestedLvl3;
}

struct NestedLvl1 {
  middle: NestedLvl2;
}

contract DeepNestedTest {
  field: NestedLvl1;

  init() {
    self.field = NestedLvl1{ middle: NestedLvl2{ inner: NestedLvl3{ deep: 123 } } };
  }
}