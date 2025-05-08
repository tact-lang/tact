struct Level4 { x: Int; }
struct Level3 { l4: Level4; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }
contract FourDeep {
 field: Level1;
 init() {
  self.field = Level1{
    l2: Level2{
      l3: Level3{
        l4: Level4{ x: 9 },
      },
    },
  };
 }
}