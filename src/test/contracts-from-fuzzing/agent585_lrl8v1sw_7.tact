struct Inner { v: Int }
struct Wrap { inner: Inner? }

contract Test {
  wrap: Wrap = Wrap{ inner: null };
  receive() {}
}