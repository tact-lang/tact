struct Desc1 { x: Int }
struct Desc2 { y: Desc1 }
struct Desc3 { z: Desc2 }

contract ThreeDeep {
  t: Desc3;

  init() {
    self.t=Desc3{z:Desc2{y:Desc1{x:17}}};
  }
}