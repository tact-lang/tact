message EmptyMsg {}

struct Wrapper {
  m: EmptyMsg;
}

contract EmptyMsgTest {
  w: Wrapper;

  init() {
    self.w = Wrapper{m: EmptyMsg{}};
  }
}