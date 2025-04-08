// Many layer nested optional
struct Leaf { x: Int }
struct Mid { l: Leaf? }
struct Outer { m: Mid? }

contract DeepNestOpt {
  o: Outer?;

  init() {
    self.o = null;
  }
}