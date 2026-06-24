message Dummy {
  value: Int;
}

struct Wrapper {
  wrapped: Dummy?;
}

const w: Wrapper = Wrapper{wrapped: null};

contract Test {
  receive() {
    let x = w;
  }
}