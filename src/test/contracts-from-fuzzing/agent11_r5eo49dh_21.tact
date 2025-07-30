struct One {
  x: Int;
}

struct Two {
  one: One?;
}

contract Test {
  receive() {
    let t = Two{one: null};
  }
}