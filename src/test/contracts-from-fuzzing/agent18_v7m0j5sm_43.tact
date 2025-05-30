struct Pair {
  left: Int;
  right: Int?;
}

contract PairHolder {
  p: Pair;

  init() {
    self.p = Pair{ left:10, right:null };
  }
}