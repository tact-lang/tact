struct InnerMost {
  x: Int?;
}

struct Middle {
  y: InnerMost;
}

contract NestedInnerOpt {
  store: Middle = Middle{
    y: InnerMost{ x: null }
  };
  receive() {}
}