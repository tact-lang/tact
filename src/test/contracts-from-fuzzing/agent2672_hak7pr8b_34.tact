struct SSS { a: Int; b: String; c: Bool }

contract InitDefaults {
  s: SSS = SSS { a: 1, b: "hi", c: true };
}