struct ContractAddress {
  workchain: Int as int8;
  hash: Int as uint256;
}

contract AddressCompound {
  addr: ContractAddress;
  init(){
    self.addr = ContractAddress{workchain:0,hash:0};
  }
}