// Large deeply nested optional fields
struct Level3 {
  data: Int?;
}

struct Level2 {
  inner: Level3?;
}

struct Level1 {
  inner: Level2?;
}

contract DeepOptionals {
  d: Level1;

  init() {
    self.d = Level1{
      inner: Level2{
        inner: Level3{
          data: null
        }
      }
    };
  }
}