contract MultiPrimitiveInit {
  flag: Bool = true;
  count: Int = 77;
  label: String = "abc";
  owner: Address;

  init() {
    self.owner = myAddress();
  }
}