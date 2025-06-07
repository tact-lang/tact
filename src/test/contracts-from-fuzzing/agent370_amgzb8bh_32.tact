struct Sub {
 x: Int;
 s: String;
}

contract MixedOpt {
 a: Sub?;
 b: Sub?;

 init() {
  self.a = null;
  self.b = null;
 }
}