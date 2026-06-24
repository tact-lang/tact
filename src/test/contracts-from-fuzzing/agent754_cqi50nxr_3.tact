struct Deep {
  lvl1: Int;
  lvl2: Nested;
}

struct Nested {
  foo: Int;
  bar: InnerNested;
}

struct InnerNested {
  baz: Bool;
  txt: String;
}

contract DeepStore {
  d: Deep = Deep{
    lvl1: 100,
    lvl2: Nested{
      foo: 200,
      bar: InnerNested{
        baz: true,
        txt: "deep",
      },
    },
  };

  init() {
    self.d = Deep{
      lvl1: 111,
      lvl2: Nested{
        foo: 222,
        bar: InnerNested{
          baz: false,
          txt: "init",
        },
      },
    };
  }
}
