struct LevelA { b: LevelB }
struct LevelB { c: LevelC }
struct LevelC { d: Int? }

contract TestContract {
  f: LevelA;

  init() {
    self.f = LevelA {
      b: LevelB {
        c: LevelC {
          d: null
        }
      }
    };
  }
}