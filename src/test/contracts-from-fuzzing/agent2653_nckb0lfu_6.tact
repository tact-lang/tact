struct Level4 { d: Int } 
struct Level3 { c: Level4 }
struct Level2 { b: Level3 }
struct Level1 { a: Level2 }

contract TestContract {
  deeplyNested: Level1;
  init() {
    self.deeplyNested = Level1{
      a: Level2{
        b: Level3{
          c: Level4{
            d: 99
          }
        }
      }
    };
  }
}