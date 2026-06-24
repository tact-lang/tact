struct SBase {
 x: Int; y:Int; }

struct SOpt {
 base: SBase?;
 flag: Bool;
}

contract OptionalBase {
  opt: SOpt;

  init() {
    self.opt = SOpt{
      base: SBase{x:1,y:2},
      flag: true
    };
  }
}