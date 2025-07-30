struct SA {
  a: Int;
}
struct SB {
  b: Bool;
}
struct SC {
  c: String;
}
struct SD {
  d: Int;
}
struct SE {
  e: Bool;
}
contract MultiNested {
  f1: SA;
  f2: SB;
  f3: SC;
  f4: SD;
  f5: SE;

  init() {
    self.f1=SA{a:1};
    self.f2=SB{b:true};
    self.f3=SC{c:"hi"};
    self.f4=SD{d:2};
    self.f5=SE{e:false};
  }
}