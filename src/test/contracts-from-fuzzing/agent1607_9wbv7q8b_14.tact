struct RemOpt {
  prefix: Int as uint16;
  suf: Slice as remaining;
}

contract OptRemain {
  data: RemOpt?;

  init() {
    self.data = null;
  }
}
