struct InitVsDefaults {
  foo: Int;
  bar: String = "def";
}

contract InitDefaultTest {
  data: InitVsDefaults;

  init() {
    self.data = InitVsDefaults{
      foo: 5
    };
  }
}
