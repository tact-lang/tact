struct SOne { x: Int }
struct STwo { s: SOne }
struct SThree { s: STwo }

contract ChainContract {
  val: SThree;

  init() {
    self.val = SThree{ s: STwo{ s: SOne{ x: 77 } } };
  }
}