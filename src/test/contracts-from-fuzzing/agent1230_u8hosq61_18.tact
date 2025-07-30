struct Middle {
  x: Int?;
  y: Bool = false;
}

struct Outer {
  inner: Middle?;
}

contract DeepOptional {
  root: Outer? = null;
}