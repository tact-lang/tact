struct Compose {
  fieldA: Int?;
  fieldB: Bool?;
  fieldC: String?;
  fieldD: Address?;
  fieldE: Cell?;
  fieldF: Slice?;
}

contract OptionalFields {
  someData: Compose;

  init() {
    self.someData = Compose{
      fieldA: 10,
      fieldB: true,
      fieldC: null,
      fieldD: null,
      fieldE: null,
      fieldF: null,
    };
  }
}