// Struct field with complex default string
struct WithStr {
  s: String = "Some Unicode: 測試 тестирование 🚀";
}

contract UnicodeDefaultString {
  data: WithStr;

  init() {
    self.data = WithStr{};
  }
}