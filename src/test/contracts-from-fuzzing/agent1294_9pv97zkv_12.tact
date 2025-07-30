struct Leaf {
  num: Int;
}

struct MidOpt {
  leaf: Leaf?;
}

contract OptNestedStructs {
  data: MidOpt? = null;
  receive() {}
}