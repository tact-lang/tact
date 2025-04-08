struct AddressA {
  hash: Int;
  active: Bool;
}

struct AddressB {
  main: AddressA;
  alias: AddressA;
}

struct User {
  id: Int;
  addrData: AddressB;
}

contract NestedStructs {
  user: User;

  init() {
    self.user = User{
      id: 123,
      addrData: AddressB{
        main: AddressA{ hash: 1, active: true },
        alias: AddressA{ hash: 2, active: false }
      }
    };
  }
}