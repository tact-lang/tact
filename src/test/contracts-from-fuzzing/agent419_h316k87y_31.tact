// Mix bools, optionals and primitives
struct All {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: Address;
  f: Address?;
  g: String;
  h: String?;
}

contract Mixed {
  f: All;

  init() {
    self.f = All{ a:1,b:null,c:true,d:null,e:myAddress(),f:null,g:"hi",h:null };
  }
}