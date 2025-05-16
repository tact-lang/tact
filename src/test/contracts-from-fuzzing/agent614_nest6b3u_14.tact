struct InnerMost { x:Int; opt:String?; }

struct Mid { inner: InnerMost?; flag: Bool; }

contract NestedOpt {
  rec: Mid;

  init() {
    self.rec = Mid{
      inner: InnerMost{
        x:123,
        opt:null
      },
      flag:true
    };
  }
}