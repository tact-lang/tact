message Child {}

struct Parent {
  child: Child?;
}

contract Test {
  receive() {
    let p = Parent{child: null};
  }
}