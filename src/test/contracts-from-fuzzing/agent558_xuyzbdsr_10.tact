struct DefaultTest {
  a: Int = 1;
  b: Int = 2;
  c: Bool = false;
  d: String = "hello";
}

contract Test {
  dt: DefaultTest = DefaultTest{};
}