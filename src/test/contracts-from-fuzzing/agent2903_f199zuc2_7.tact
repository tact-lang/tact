struct Middle {
  s: String;
}

struct Wrapper {
  inner: Middle;
}

contract OptNested {
  w: Wrapper? = null;
}