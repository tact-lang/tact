struct FirstLevel { x: Int; }
struct SecondLevel { y: FirstLevel; }
struct ThirdLevel { z: SecondLevel; }
struct FourthLevel { w: ThirdLevel; }

contract FourDeepNest {
  data: FourthLevel;

  init() {
    self.data = FourthLevel{
      w: ThirdLevel{
        z: SecondLevel{ y: FirstLevel{ x: 11 } }
      }
    };
  }
}
