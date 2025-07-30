struct OptionalScenario {
  maybeNumber: Int?;
  maybeFlag: Bool?;
  maybeText: String?;
}

contract OptionalTest {
  data: OptionalScenario;

  init() {
    self.data = OptionalScenario{
      maybeNumber: null,
      maybeFlag: true,
      maybeText: null
    };
  }
}