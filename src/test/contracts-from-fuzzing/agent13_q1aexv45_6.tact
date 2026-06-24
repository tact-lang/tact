struct WithMap {
  m: map<Int, Bool>;
}

contract NestedMap {
  store: WithMap;

  init() {
    self.store = WithMap{m: emptyMap()};
  }
}