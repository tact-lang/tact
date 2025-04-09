struct OptDeep1 { x: Int?; }
struct OptDeep2 { y: OptDeep1?; }
struct OptDeep3 { z: OptDeep2?; }

contract Test18 {
  deepOpt: OptDeep3;

  init() {
    self.deepOpt = OptDeep3{
      z: OptDeep2{ y: OptDeep1{ x: null } }
    };
  }
}