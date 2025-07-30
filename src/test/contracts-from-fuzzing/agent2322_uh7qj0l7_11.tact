struct Level1 { next: Level2?; val: Int; }
struct Level2 { next: Level3?; val: Bool; }
struct Level3 { next: Level4?; val: String; }
struct Level4 { val: Int?; }

contract MultiOptionalNest {
  start: Level1 = Level1{
    next: Level2{
      next: Level3{
        next: Level4{
          val: null
        },
        val: "hi"
      },
      val: true
    },
    val: 5
  };

  init() {}
}
