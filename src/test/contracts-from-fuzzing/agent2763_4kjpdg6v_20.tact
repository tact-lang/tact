struct One { a: Int }
struct Two { b: Int }
struct Three { c: Int }

struct BigCombo {
  one: One;
  two: Two;
  three: Three;
  optOne: One?;
  optTwo: Two?;
  optThree: Three?;
}

contract ComboStructOpt {
  x: BigCombo;

  init() {
    self.x = BigCombo{
      one: One{a:1},
      two: Two{b:2},
      three: Three{c:3},
      optOne: null,
      optTwo: null,
      optThree: null,
    };
  }
}