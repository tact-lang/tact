struct MultiOpt {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Int?;
  g: Int?;
  h: Int?;
}

contract TestContract {
  data: MultiOpt;

  init() {
    self.data = MultiOpt{
      a:null, b:null, c:null, d:null,
      e:null, f:null, g:null, h:null
    };
  }
}