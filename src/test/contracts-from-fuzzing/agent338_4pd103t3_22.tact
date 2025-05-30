struct Leaf {
  score: Int? = null;
}

struct Mid {
  leaf: Leaf?;
  active: Bool? = null;
}

struct Top {
  middle: Mid?;
  label: String = "x";
}

contract TestContract {
  val: Top;

  init() {
    self.val = Top{
      middle: null,
      label: "init"
    };
  }
}