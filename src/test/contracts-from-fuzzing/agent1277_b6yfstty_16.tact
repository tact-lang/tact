struct Optionals {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: String?;
  e: Int?;
  f: Bool?;
  g: String?;
}

contract TestContract {
  opt: Optionals;
  init() {
    self.opt = Optionals{
      a:null, b:true, c:null, d:null, e:null, f:null, g:null
    };
  }
}