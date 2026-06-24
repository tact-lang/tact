struct ComboOpt {
  a: Int?;          // implicit null default
  b: String? = null; // explicit null default
}

contract OptMixDecl {
  data: ComboOpt = ComboOpt{};

  init() {
    self.data = ComboOpt{};
  }
}
