struct S {
  a: Int;
  b: String;
  c: Bool;
  d: Address;
}
contract DoubleS {
  x: S;
  y: S;

  init() {
    self.x = S{ a:1,b:"x",c:true,d:myAddress() };
    self.y = S{ a:2,b:"y",c:false,d:myAddress() };
  }
}