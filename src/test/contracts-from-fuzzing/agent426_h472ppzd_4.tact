struct Level1 {
  a: Int;
}

struct Level2 {
  l1: Level1;
}

contract OptionalNested {
    foo: Level2? = null;
}