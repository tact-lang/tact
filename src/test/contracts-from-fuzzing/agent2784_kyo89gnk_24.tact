struct DeepDefaults {
  a: Int = 1;
  b: Deepper;
}

struct Deepper {
  c: Int;
  d: BooleanOptional;
}

struct BooleanOptional {
  e: Bool?;
}

contract NestedCompDefaults {
  val: DeepDefaults;

  init() {
    self.val = DeepDefaults{
      b: Deepper{
        c: 20,
        d: BooleanOptional{e: null}
      }
    };
  }
}