struct InnerMost { val: Int; opt: Bool?; }
struct Middle {
  f1: InnerMost; 
  optInt: Int?;
}
struct Outer {
  s: Middle;
  flag: Bool;
}

contract ManyNestOpts {
  data: Outer;

  init() {
    self.data = Outer{
      s: Middle{
        f1: InnerMost{val:42,opt:null},
        optInt:null
      },
      flag:true
    };
  }
}