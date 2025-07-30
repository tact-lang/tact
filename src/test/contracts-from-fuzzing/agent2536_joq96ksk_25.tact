// deeply nested struct with default-initialized default null optionals
struct Bottom {
  v: Int? = null;
}

struct Middle {
  bot: Bottom? = null;
}

struct Top {
  mid: Middle? = null;
}

contract DeepDefaultNulls {
  t: Top;

  init() {
    self.t = Top{};
  }
}