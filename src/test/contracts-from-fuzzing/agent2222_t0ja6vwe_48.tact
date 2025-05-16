struct Agg {
  x: Int;
  y: Bool;
}
contract MixPeriods {
  a: Int = 1;
  b: Int;
  c: Bool = true;
  d: Bool;
  e: Agg;

  init() {
    self.b=2; self.d=false; self.e=Agg{x:3,y:true};
  }
}