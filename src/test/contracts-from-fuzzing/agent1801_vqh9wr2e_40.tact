struct N { i: Int; }

contract OptList {
  na: N?;
  nb: N?;

  init() {
    self.na = null;
    self.nb = N{i:42};
  }
}