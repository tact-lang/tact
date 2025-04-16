// nested struct with composite and optional
struct S {
  x: Int;
  y: Bool?;
}
struct T {
  s: S;
  m: String?;
}
contract NestCombo {
  store: T;
  init() {
    self.store = T{ s: S{ x:1, y: null }, m: null };
  }
}