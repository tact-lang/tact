struct Level1 { a:Int; b:Int?; }
struct Level2 { c:Level1; d:Level1?; }
struct Level3 { e:Level2; f:Level2?; }

contract DeepVariant {
  data: Level3;

  init() {
    self.data = Level3{
      e: Level2{ c:Level1{a:1,b:null}, d:null },
      f: null
    };
  }
}