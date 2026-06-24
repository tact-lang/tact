struct Inner { x: Int?; y: Bool? }
struct Middle { i: Inner?; z: Int }
struct Outer { m: Middle }

contract Test {
  outer: Outer = Outer{ m: Middle{ i: null, z: 0 } };
  receive() {}
}