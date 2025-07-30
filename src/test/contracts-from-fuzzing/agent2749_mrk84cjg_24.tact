struct SOpt {
 op: Bool?;
}

contract NestedInContract {
  s: SOpt?;
  init() {
    self.s = null;
  }
}