struct Leaf {
  x: Int = 123;
}

struct Mid {
  leaf: Leaf?;
}

struct Top {
  mid: Mid? = null;
}

contract TestOptionalWithDefaults {
  data: Top;

  init() {
    self.data = Top{};
  }
}