struct AAA { a: Int; }
struct BBB { b: AAA; }
struct CCC { c: BBB; }
struct DDD { d: CCC; }
struct EEE { e: DDD; }

contract MegaDeep {
  state: EEE;

  init() {
    self.state = EEE{ e: DDD{ d: CCC{ c: BBB{ b: AAA{ a: 42 } } } } };
  }
}
