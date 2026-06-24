struct Wrapper {
  data: Int;
}

message Container {
  w: Wrapper;
}

contract Test {
  receive() {
    Container{w: Wrapper{data: 42}};
  }
}