struct Nested {
  a: Bool;
  b: Level2;
}

struct Level2 {
  c: String;
  d: Level3;
}

struct Level3 {
  e: Address;
}

contract TestContract {
  n: Nested;

  init() {
    self.n = Nested{
      a: true,
      b: Level2{
        c: "test",
        d: Level3{
          e: myAddress()
        }
      }
    };
  }
}