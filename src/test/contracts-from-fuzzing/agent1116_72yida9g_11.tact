struct Recursing {
  sub: Wrapper?;
}

struct Wrapper {
  param: Int;
}

contract EdgeTest {
  data: Recursing?;

  init() {
    self.data = Recursing{ sub: Wrapper{ param: 42 } };
  }
}