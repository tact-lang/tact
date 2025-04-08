struct OptionalDuo {
  x: Int?;
  y: Int?;
}

contract DuoOptTest {
  data: OptionalDuo;

  init() {
    self.data = OptionalDuo{
      x: null,
      y: 42
    };
  }
}