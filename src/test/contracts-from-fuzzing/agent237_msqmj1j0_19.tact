struct AddrAndOpts {
  owner: Address; 
  backup: Address?;
  name: String;
}

contract ContractAddrOpt {
  data: AddrAndOpts;
  init() {
    self.data = AddrAndOpts{
      owner: myAddress(),
      backup: null,
      name: "abc"
    };
  }
}