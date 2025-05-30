// test optional bool default
contract OptBoolDefault {
  ready: Bool? = null;

  init() {
    self.ready = true;
  }
}