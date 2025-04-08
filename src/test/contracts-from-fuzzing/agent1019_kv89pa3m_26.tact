struct Zero {
  val: Int as uint1; // minimal serialization
}

contract Tiny {
  z: Zero;

  init() {
    self.z = Zero{ val: 1 };
  }
}
