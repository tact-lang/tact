struct LevelA { 
  val: Int;
}
struct LevelB {
  inner: LevelA;
}
struct LevelC {
  inner: LevelB;
}
struct LevelD {
  inner: LevelC;
}

contract MultiDepth {
  d: LevelD;
  init(){
    self.d = LevelD{
      inner: LevelC{
        inner: LevelB{
          inner: LevelA{
            val:42
          }
        }
      }
    };
  }
}