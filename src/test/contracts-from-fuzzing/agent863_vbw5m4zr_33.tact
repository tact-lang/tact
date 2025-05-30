struct O1 {
  value: Int;
}

struct O2 {
  n1: O1;
  n2: O1;
}

contract NestedSame {
  data: O2;

  init() {
    self.data = O2{ n1: O1{value:1}, n2: O1{value:2} };
  }
}