struct L5 { q: Int }
struct L4 { p: L5 }
struct L3 { o: L4? }
struct L2 { n: L3 }
struct L1 { m: L2 }

contract TestContract {
  chain: L1;
  init() {
    self.chain = L1{ m: L2{ n: L3{ o: null } } };
  }
}