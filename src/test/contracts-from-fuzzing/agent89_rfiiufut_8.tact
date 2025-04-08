struct SingleOpt {
  v: Int?;
}

contract OptFieldInit {
  state: SingleOpt;

  init() {
    self.state = SingleOpt{v: null};
  }
}
