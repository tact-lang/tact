struct Inner { val: Int; }

struct Outer {
  nested: Inner?;
  flag: Bool;
}

contract Test(param: Outer) {}
