// testing serialization formats combined with optionals in contract storage
struct Mix {
  a: Int as int8; // -128 to 127
  b: Int?;
  c: Int as uint32;
  d: Bool;
  e: Bool?;
  f: String;
  g: String?;
}

contract SerOpt {
    val: Mix;
    init() {
        self.val = Mix{
            a: 42,
            b: null,
            c: 123456,
            d: true,
            e: null,
            f: "hi",
            g: null
        };
    }
}