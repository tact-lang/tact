struct Inner { y: Int }

struct Outer { inner: Inner }

contract Test {
  receive() {
    let s = Outer{ inner: Inner{ y: 10 } };
  }
}