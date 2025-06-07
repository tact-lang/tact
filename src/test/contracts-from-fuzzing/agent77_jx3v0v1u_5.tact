struct Mix {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract MixTest {
    m: Mix;

    init() {
        self.m = Mix{
            a: 42, b: false, c: "hi",
            d: null, e: null, f: null
        };
    }
}