struct ContainContractRef {
  addr: Address;
  code: Cell;
}

contract ContractWithContractData {
  data: ContainContractRef;

  init() {
    self.data = ContainContractRef{
      addr: myAddress(),
      code: myCode(),
    };
  }
}