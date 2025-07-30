// Testing nested optional structs with default nulls
struct Level3 {
  a: Int?;
}

struct Level2 {
  b: Level3?;
}

struct Level1 {
  c: Level2?;
}

contract NullNestedOptions {
  root: Level1;

  init() {
      self.root = Level1{
          c: null
      };
  }
}