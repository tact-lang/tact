// nested optional fields across 3 levels with some null, some not
struct Level3 { foo: Int?; }
struct Level2 { bar: Level3?; }
struct Level1 { baz: Level2?; }

contract TestContract {
  s: Level1;

  init() {
    self.s = Level1{
      baz: Level2{
        bar: null
      }
    };
  }
}