struct Level1 { a: Int }
struct Level2 { a: Level1 }
struct Level3 { a: Level2 }
struct Level4 { a: Level3 }
struct Level5 { a: Level4 }
struct Level6 { a: Level5 }
struct Level7 { a: Level6 }

contract Deep7 {
  val: Level7;

  init() {
    self.val = Level7{ a: Level6{ a: Level5{ a: Level4{ a: Level3{ a: Level2{ a: Level1{ a: 10 } } } } } } };
  }
}