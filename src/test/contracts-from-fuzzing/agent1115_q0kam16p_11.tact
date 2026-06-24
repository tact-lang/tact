// a struct with default values including optional fields
struct Defaults {
  number: Int = 42;
  name: String = "Tact";
  peek: Bool = true;
  optCount: Int?;
}

contract TestContract {
  data: Defaults;

  init() {
    self.data = Defaults{};
  }
}