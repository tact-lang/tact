struct Level4 { val: Int; }
struct Level3 { x: Level4; y: Level4; }
struct Level2 { a: Level3; b: Level3; }
struct Level1 { foo: Level2; bar: Level2; }

contract DeepWide {
  nested: Level1;

  init() {
    self.nested = Level1{
      foo: Level2{
        a: Level3{ x: Level4{val:1}, y: Level4{val:2} },
        b: Level3{ x: Level4{val:3}, y: Level4{val:4} }
      },
      bar: Level2{
        a: Level3{ x: Level4{val:5}, y: Level4{val:6} },
        b: Level3{ x: Level4{val:7}, y: Level4{val:8} }
      }
    };
  }
}