struct Level1 { a: Int; b: Bool; c: Int?; d: Bool?; }
struct Level2 { one: Level1; two: Level1; }
struct Level3 { top: Level2; bottom: Level2; flag: Bool; }

contract MultiNode {
  x: Level3;
  init() {
    self.x = Level3{
      top: Level2{
        one: Level1{ a:1, b:true, c:null, d:null },
        two: Level1{ a:2, b:false, c:3, d:true },
      },
      bottom: Level2{
        one: Level1{ a:5, b:true, c:null, d:false },
        two: Level1{ a:6, b:true, c:7, d:null },
      },
      flag: false,
    };
  }
}