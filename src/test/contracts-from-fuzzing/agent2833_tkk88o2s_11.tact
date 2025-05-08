struct S1 { foo: Int; }
struct S2 { s1: S1; bar: Int; }
struct S3 { s2: S2; baz: Int; }

contract ChainDeck {
  chain: S3;

  init() {
    self.chain = S3{
      s2: S2{
        s1: S1{ foo: 11 },
        bar: 22
      },
      baz: 33
    };
  }
}