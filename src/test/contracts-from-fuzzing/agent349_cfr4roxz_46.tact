// Compose nested contract persistent storage mixing optionals, nulls, set values
struct S0 { x: Int?; y: Bool; }
struct S1 { inner: S0?; z: String; }
struct S2 { mid: S1; }

contract MixedDeepOpt {
  root: S2;
  init() {
    self.root = S2{
      mid: S1{
        inner: null,
        z: "abc"
      }
    };
  }
}