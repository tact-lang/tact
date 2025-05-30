struct Deep {
  p: Bool;
}

struct Mid {
  child: Deep;
}

struct Top {
  nested: Mid;
}

contract NestedTest {
  val: Top = Top{ nested: Mid{ child: Deep{ p: false }}};
}