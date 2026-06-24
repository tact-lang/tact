struct Nested {
  level2: Inner2;
}

struct Inner2 {
  level3: Inner3;
}

struct Inner3 {
  finalVal: Int;
}

contract NestedChain {
  nested: Nested;
  init() {
    self.nested = Nested{ level2: Inner2{ level3: Inner3{ finalVal: 42 } } };
  }
}