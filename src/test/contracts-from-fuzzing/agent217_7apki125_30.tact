struct LEVEL1 { a: Int; }
struct LEVEL2 { l1: LEVEL1; }
struct LEVEL3 { l2: LEVEL2; }
struct LEVEL4 { l3: LEVEL3; }
struct LEVEL5 { l4: LEVEL4; }

contract Deep5Levels {
  storage: LEVEL5;

  init() {
    self.storage = LEVEL5{
      l4: LEVEL4{
        l3: LEVEL3{
          l2: LEVEL2{
            l1: LEVEL1{ a: 123 }
          }
        }
      }
    };
  }
}