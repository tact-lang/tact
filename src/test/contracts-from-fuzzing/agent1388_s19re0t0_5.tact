struct FinalLevel {
  txt: String;
}

struct MidLevel {
  sub: FinalLevel?;
}

struct RootWrapper {
  inner: MidLevel?;
}

contract NestedOptsTest {
  item: RootWrapper;

  init() {
    self.item = RootWrapper{ inner: null };
  }
}
