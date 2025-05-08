const K1: Int = 3;
const K2: Int = K1 + 7;

struct TestS {
  v: Int = K2;
}

contract ConstChain {
  s: TestS = TestS{};
  init() {}
}
