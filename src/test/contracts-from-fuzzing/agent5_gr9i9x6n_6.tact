struct OptionalString {
  title: String?;
  comment: String?;
}

struct Complex {
  number: Int;
  flag: Bool;
  value: OptionalString;
}

contract OptionalStringContract {
  data: Complex;

  init() {
    self.data = Complex{
      number: 42,
      flag: true,
      value: OptionalString{
        title: null,
        comment: null
      }
    };
  }

  receive() {
    if (self.data.value.title != null) {
      let _ = self.data.value.title!!;
    }
  }
}
