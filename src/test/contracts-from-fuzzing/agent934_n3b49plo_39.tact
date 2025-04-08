struct N0 { val: Int }
struct N1 { val: N0? }
struct N2 { val: N1? }
contract DeepOptChain {
  chain: N2;
  init() {
    self.chain = N2{ val: null };
  }
}