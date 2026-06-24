struct SOpt {
  optI: Int?;
  optB: Bool?;
  optS: String?;
}

contract Test {
  data: SOpt;
  init() {
    self.data = SOpt{
      optI: null,
      optB: true,
      optS: null,
    };
  }
}
