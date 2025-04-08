// Struct with Address + Optionals combination
struct AddressWithOptionals {
  main: Address;
  backup1: Address?;
  backup2: Address?;
}

contract AddressOptContract {
  data: AddressWithOptionals;

  init() {
    self.data = AddressWithOptionals{
      main: myAddress(),
      backup1: null,
      backup2: null
    };
  }
}