struct Opts {
  a:Int?; b:Bool?; c:String?; d:Address?;
}

struct Wrap {
  opts: Opts?;
}

contract OptOptWrap {
  f: Wrap;
  init() {
    self.f = Wrap{opts:null};
  }
}