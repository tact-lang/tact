struct NestedOptional {
  level1: Int?;
  level2: Nested2?;
}

struct Nested2 {
  level3: Nested3?;
}

struct Nested3 {
  payload: String?;
}

contract OptionalTree {
  data: NestedOptional;

  init() {
    self.data = NestedOptional{
      level1: null,
      level2: Nested2{
        level3: Nested3{
          payload: null
        }
      }
    };
  }
}
