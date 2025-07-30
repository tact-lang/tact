// Contract with optional struct field and remaining slice inside
struct Leaf {
  text: String;
}

struct Container {
  leaf: Leaf?;
  tail: Slice as remaining;
}

contract OptAndRemain {
  data: Container;

  init() {
    self.data = Container{
      leaf: null,
      tail: emptyCell().asSlice()
    };
  }
}