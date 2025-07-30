struct Inner {
  flag: Bool?;
}

struct Mid {
  nested: Inner?;
}

contract NestedOpt {
  mid: Mid?;
}
