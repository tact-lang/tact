// Deep nested optional with explicitly null struct field on inner

struct Inner {
  value: Int?;
}

struct Mid {
  inner: Inner?;
}

contract ExplicitNullInner {
  state: Mid;

  init() {
    self.state = Mid{
      inner: null
    };
  }
}