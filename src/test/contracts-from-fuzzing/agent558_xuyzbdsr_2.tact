struct Inner {
  val1: Int;
  val2: Bool;
}

struct Outer {
  nested: Inner;
  flag: Bool;
}

contract Test {
  data: Outer = Outer{
    nested: Inner{ val1:1, val2:true },
    flag: false
  };
}