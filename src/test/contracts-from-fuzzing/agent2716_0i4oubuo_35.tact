struct Level0 { x:Int; }
struct Level1 { p:Level0; }
struct Level2 { p:Level1; }
struct Level3 { p:Level2; }
struct Level4 { p:Level3; }
struct Level5 { p:Level4; }
struct Level6 { p:Level5; }
struct Level7 { p:Level6; }
struct Level8 { p:Level7; }

contract DeepLevels {
  data: Level8;
  init() {
    self.data = Level8{p:Level7{p:Level6{p:Level5{p:Level4{p:Level3{p:Level2{p:Level1{p:Level0{x:42}}}}}}}}};
  }
}