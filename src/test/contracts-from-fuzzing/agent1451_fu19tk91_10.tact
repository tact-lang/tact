struct Level4 { x: Int? }

struct Level3 { l4: Level4 }

struct Level2 { l3: Level3 }

struct Level1 { l2: Level2 }

contract OptionalDeepNest {
  root: Level1? = null;

  receive() {
    self.root = self.root;
  }
}