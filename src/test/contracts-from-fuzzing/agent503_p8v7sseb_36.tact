struct Bottom {
  n: Int = 7;
}

struct Mid {
  b: Bottom = Bottom{};
}

struct Top {
  m: Mid? = null;
}

contract OptionalMidNull {
  data: Top;

  init() {
    self.data = Top{ m: null };
  }
}
