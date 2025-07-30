struct InnerMost {
  f1: Int;
  f2: Bool?;
}

struct Middle {
  im1: InnerMost;
  im2: InnerMost;
  opt: InnerMost?;
}

struct Wrapper {
  deep: Middle;
}

contract NestedOptStructs {
  st: Wrapper;
  init() {
    self.st = Wrapper{
      deep: Middle{
        im1: InnerMost{f1:1,f2:true},
        im2: InnerMost{f1:2,f2:null},
        opt: null
      }
    };
  }
}