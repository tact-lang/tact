// Contract with various nested structs and some default nulls
struct X { f: Int?; }
struct Y { x: X?; }
struct Z { y: Y?; }

contract MixDefaults {
  z: Z;

  init() {
    self.z = Z{
      y: null
    };
  }
}