struct TestDefaults {
  val1: Int;
  val2: Int? = null;
  txt: String = "abc";
}

contract DefaultsContract {
    data: TestDefaults;
    init() {
        self.data = TestDefaults{ val1: 5 };
    }
}