struct NestedArrangement {
  id: Int;
  opt1: Bool?;
  label: String;
  opt2: String?;
}

contract ArrangementTest {
  state: NestedArrangement;

  init() {
    self.state = NestedArrangement{
      id: 1,
      opt1: true,
      label: "LBL",
      opt2: null
    };
  }
}