struct OptLeaf {
  q: Int?;
}

struct OptMid {
  w: OptLeaf?;
}

struct OptTop {
  e: OptMid?;
}

contract DeepOptionalDefault {
  v: OptTop = OptTop{ e: null };
}
