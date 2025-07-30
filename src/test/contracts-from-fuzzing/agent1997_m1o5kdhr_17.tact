struct DeepDefault {
  important: Int = 42;
  optionalName: String?;
}

struct Top {
  nested: DeepDefault;
  flag: Bool;
}

contract DefaultsTest {
  header: Top;

  init() {
    self.header = Top{
      nested: DeepDefault{
        optionalName: null
      },
      flag: false
    };
  }
}
