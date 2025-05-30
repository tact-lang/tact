message N {}

struct Wrapper {
  inner: N;
}

contract Test {
  receive() {
    let w = Wrapper{inner: N{}};
  }
}