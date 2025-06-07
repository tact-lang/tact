struct S {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;
  f: String?;
}

contract MixedOptional {
    data: S;

    init() {
        self.data = S{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "x",
            f: null
        };
    }
}