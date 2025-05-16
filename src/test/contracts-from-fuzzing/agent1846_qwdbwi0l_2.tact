struct NestedTest {
  x: Int = 1;
  y: Bool?;
}

contract StructFieldDefaults {
  foo: NestedTest = NestedTest{};
}