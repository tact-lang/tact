struct Flat {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Bool?;
  f: String?;
}

contract DirectMany {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Bool?;
  f: String?;
  s: Flat;
  init() {
    self.a = 1;
    self.b = false;
    self.c = "str";
    self.d = myAddress();
    self.e = true;
    self.f = null;
    self.s = Flat{a:1,b:true,c:"s",d:myAddress(),e:null,f:null};
  }
}