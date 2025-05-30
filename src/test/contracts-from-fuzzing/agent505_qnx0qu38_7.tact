struct Level4 {
  z: Int;
}

struct Level3 {
  y: Level4;
  opt: String?;
}

struct Level2 {
  middle: Level3;
}

struct Level1 {
  top: Level2;
}

contract Multilevel {
  root: Level1 = Level1{
    top: Level2{
      middle: Level3{
        y: Level4{z:99},
        opt:null
      }
    }
  };

  init() {
    self.root = self.root;
  }

  receive() {
    self.root = self.root;
  }
}