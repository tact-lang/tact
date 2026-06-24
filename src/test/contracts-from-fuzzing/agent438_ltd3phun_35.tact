// Contract with contract field + struct field with defaults
struct Data {
  value: Int = 7;
}

contract TestContract {
  counter: Int = 5;
  d: Data = Data{};

  init() {}
}