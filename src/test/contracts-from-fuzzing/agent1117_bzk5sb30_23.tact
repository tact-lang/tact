struct SInner { iv: Int }
struct SOuter { inner: SInner }

contract DefNest {
  pair: SOuter = SOuter{ inner: SInner{ iv: 7 } };

  init() {
    self.pair = SOuter{ inner: SInner{ iv: 20 } };
  }
}
