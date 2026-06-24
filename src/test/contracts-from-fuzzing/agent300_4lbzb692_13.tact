struct L2 {
  v: Int;
}

struct L1 {
  l2a: L2;
  l2b: L2?;
}

struct Root {
  l1a: L1;
  l1b: L1?;
}

contract Test {
  r: Root = Root {
    l1a: L1 { l2a: L2 { v:1 }, l2b: null },
    l1b: null
  };
}