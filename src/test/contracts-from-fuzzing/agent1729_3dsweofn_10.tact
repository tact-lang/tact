struct S {
  intF: Int;
  boolF: Bool;
  strF: String;
  addrF: Address;
  optInt: Int?;
}

contract TestContract {
  s: S;

  init() {
    self.s = S{
      intF: 5,
      boolF: true,
      strF: "abc",
      addrF: myAddress(),
      optInt: null,
    };
  }
}