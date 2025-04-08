struct DeepOptional {
  inner: InnerOption?;
}

struct InnerOption {
  nested: InnerMostOption?;
}

struct InnerMostOption {
  value: Int?;
  text: String?;
}

contract OptionalInside {
  testField: DeepOptional;
  init() {
    self.testField = DeepOptional {
      inner: InnerOption {
         nested: InnerMostOption {
            value: null,
            text: null,
         }
      }
    };
  }
}
