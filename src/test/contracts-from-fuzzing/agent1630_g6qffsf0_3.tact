struct Deep {
  one: Int;
  two: Bool?;
  three: String;
}

struct Wrapper {
  wrapped: Deep;
  label: String;
}

contract OptionalNested {
  field: Wrapper;

  init() {
    self.field = Wrapper{
      wrapped: Deep{ one: 7, two: null, three: "deep" },
      label: "nested"
    };
  }
}