// multiple layers of nested structs with optional message struct leaf
message(99) LeafMsg {
  value: Int;
}

struct Level3 { m: LeafMsg?; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract TestContract {
  data: Level1;

  init() {
    self.data = Level1{ l2: Level2{ l3: Level3{ m: null }}};
  }
}