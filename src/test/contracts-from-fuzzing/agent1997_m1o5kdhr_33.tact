struct SerialOpt {
  v: Int? as uint32;
}

contract SerialOptContract {
  s: SerialOpt;

  init() {
    self.s = SerialOpt{ v: null };
  }
}
