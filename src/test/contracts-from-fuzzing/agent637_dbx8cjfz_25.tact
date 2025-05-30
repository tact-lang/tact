// persistent state: optional slice inside optional struct
struct SliceWrap {
  s: Slice?;
}

contract OptInOpt {
  wrap: SliceWrap?;

  init() {
    self.wrap = SliceWrap {
      s: null
    };
  }
}