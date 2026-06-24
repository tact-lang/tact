struct OptionalFields {
  foo: Int?;
  bar: Bool?;
  name: String?;
}

contract TestContract {
  data: OptionalFields?;

  init() {
    self.data = OptionalFields{
      foo:123,
      bar:true,
      name:"foobar"
    };
  }
}