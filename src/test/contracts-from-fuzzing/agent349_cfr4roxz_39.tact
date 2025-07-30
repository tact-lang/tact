// Compose with multiple nested persistent struct layers
struct Inner {
  foo: Int;
  bar: Bool;
  text: String;
}

struct Middle {
  inr: Inner;
  flag: Bool;
}

struct Outer {
  mid: Middle;
  alive: Bool;
}

contract CompoundNested {
  store: Outer;
  init() {
    self.store = Outer{ mid: Middle{ inr: Inner{ foo: 7, bar: true, text: "abc" }, flag: false }, alive: true };
  }
}