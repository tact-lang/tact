struct SA { foo: Int?; }
struct SB { bar: Bool?; }
struct SC { baz: String?; }

struct ManyOptNested {
  a: SA;
  b: SB;
  c: SC;
}

contract ComposeOpts {
  x: ManyOptNested;

  init() {
    self.x = ManyOptNested{
      a: SA{foo: null},
      b: SB{bar: null},
      c: SC{baz: null}
    };
  }
}