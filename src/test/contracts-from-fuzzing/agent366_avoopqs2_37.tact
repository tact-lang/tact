struct LevelA {
 x: Int;
}
struct LevelB {
 a: LevelA;
}
struct LevelC {
 b: LevelB;
}
struct LevelD {
 c: LevelC;
}
struct LevelE {
 d: LevelD;
}
struct LevelF {
 e: LevelE;
}
struct LevelG {
 f: LevelF;
}

contract DeepSeven {
 root: LevelG;
 init() {
  self.root = LevelG{
    f: LevelF{
      e: LevelE{
        d: LevelD{
          c: LevelC{
            b: LevelB{
              a: LevelA{
                x: 77
              }
            }
          }
        }
      }
    }
  };
 }
}