struct ManyAddresses {
  a1: Address;
  a2: Address;
  a3: Address;
}

contract AddrTest {
  s: ManyAddresses;

  init() {
    let me = myAddress();
    self.s = ManyAddresses{
      a1: me,
      a2: me,
      a3: me
    };
  }
}
