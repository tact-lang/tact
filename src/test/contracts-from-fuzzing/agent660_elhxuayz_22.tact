struct AddressOpt {
  addr: Address?;
}

contract AddressOptTest {
  data: AddressOpt;

  init() {
    self.data = AddressOpt{ addr: null };
  }
}