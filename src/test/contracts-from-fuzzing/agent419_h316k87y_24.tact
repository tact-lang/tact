// nested struct with nested bools, addresses and optionals
struct Nested {
  flag: Bool;
  addr: Address;
  optInt: Int?;
  optAddr: Address?;
}

contract ManyKinds {
  s: Nested;

  init() {
    self.s = Nested{
      flag:true,
      addr:myAddress(),
      optInt:null,
      optAddr:null
    };
  }
}