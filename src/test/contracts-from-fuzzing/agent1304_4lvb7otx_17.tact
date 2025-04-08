struct Level3 { foo: Int? = null; flag: Bool = false; }
struct Level2 { inner: Level3; }
struct Level1 { l2: Level2; val: Int = 0; }

contract DefaultNested {
  data: Level1;

  init() {
    self.data = Level1{ l2: Level2{ inner: Level3{} }, val: 0 };
  }
}