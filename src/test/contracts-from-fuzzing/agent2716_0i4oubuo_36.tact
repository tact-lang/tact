struct SingleOpt {
  value: Int?;
}
contract SingleOptField {
  data: SingleOpt;
  init() {
    self.data = SingleOpt{value: null};
  }
}