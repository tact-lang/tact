struct Level3 { x: Int; y: Bool? }
struct Level2 { a: Int; b: Level3 } 
struct Level1 { arr: Level2; k: Bool }

contract TestPersists {
  nested: Level1;

  init() {
    self.nested = Level1{
      arr: Level2{
        a: 5,
        b: Level3{
          x: 7,
          y: true
        }
      },
      k: false
    };
  }
}
