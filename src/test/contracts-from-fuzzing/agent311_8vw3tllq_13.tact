struct OptionalDeeper {
  level: InnerMost?;
}

struct InnerMost {
  foo: Middle?;
}

struct Middle {
  bar: BottomMost?;
}

struct BottomMost {
  baz: Int;
}

contract ManyOptionals {
  storage: OptionalDeeper;

  init() {
    self.storage = OptionalDeeper{
      level: InnerMost{
        foo: Middle{
          bar: BottomMost{
            baz: 33
          }
        }
      }
    };
  }
}