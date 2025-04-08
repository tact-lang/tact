// many levels of nested structs, deep chain
struct Level1 { v: Int; }
struct Level2 { s: Level1; }
struct Level3 { s: Level2; }
struct Level4 { s: Level3; }
struct Level5 { s: Level4; }

contract TestContract {
  data: Level5;

  init() {
    self.data = Level5{
      s: Level4{
        s: Level3{
          s: Level2{
            s: Level1{
              v: 999
            }
          }
        }
      }
    };
  }
}