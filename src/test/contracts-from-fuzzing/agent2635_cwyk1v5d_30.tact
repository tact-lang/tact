struct OptionalBottom {
  s: String?;
}

struct MidLayer {
  opt: OptionalBottom;
}

struct TopLayer {
  nest: MidLayer;
}

contract ChainOpt {
  store: TopLayer;
  init(){
    self.store = TopLayer{
      nest: MidLayer{
        opt: OptionalBottom{ s: null }
      }
    };
  }
}