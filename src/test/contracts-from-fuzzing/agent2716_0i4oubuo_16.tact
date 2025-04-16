struct Arranged {
  n: Int;
  opt: Int?;
  b: Bool;
  s: String;
  o2: String?;
}

contract ArrangeFields {
  data: Arranged;

  init() {
    self.data = Arranged{
      n:1,opt:null,b:true,s:"txt",o2:null
    };
  }
}