struct SOpt1 { f: Int?; }
struct SOpt2 { inner: SOpt1?; }
struct SOpt3 { inner: SOpt2?; }
contract OptChain {
 val: SOpt3?;
 init() {
  self.val = null;
 }
}