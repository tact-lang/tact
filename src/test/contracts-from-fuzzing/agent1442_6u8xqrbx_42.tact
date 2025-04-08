// fuzz: nested struct w/ serialization and optional
struct Inner {
  a:Int as uint8;
  b:Bool;
}
struct Outer {
  inn: Inner?;
  s: String;
}
contract TestContract {
  o: Outer;
  init() { self.o = Outer{inn: null, s:"hi"}; }
}