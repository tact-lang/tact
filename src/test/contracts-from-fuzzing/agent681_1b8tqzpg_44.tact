struct Leaf {
  a: Int?;
}

struct Mid {
  x: Int;
  leaf: Leaf;
}

contract MidDefault {
  m: Mid = Mid{x:42, leaf:Leaf{a:null}};
}