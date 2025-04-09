struct Nested {
  foo: Int;
  bar: String?;
}

struct Wrapper {
  nested: Nested;
  optString: String?;
  flag: Bool;
}

contract TestContract {
  info: Wrapper;

  init() {
    self.info = Wrapper{
      nested: Nested{
        foo: 123,
        bar: null
      },
      optString: "hi",
      flag: true
    };
  }
}