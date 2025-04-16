struct DefaultsAndExplicit {
  a: Int = 5;
  b: Bool = true;
  c: String = "abc";
}

contract DefExplicitContract {
  data: DefaultsAndExplicit;

  init() {
    self.data = DefaultsAndExplicit{};
  }

  receive() {
    let _ = self.data;
  }
}