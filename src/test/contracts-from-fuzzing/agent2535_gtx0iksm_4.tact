struct InnerMost {
  flag: Bool;
  note: String;
}

struct Middle {
  payload: InnerMost?;
}

contract OptionalNested {
  data: Middle;

  init() {
    self.data = Middle {
      payload: InnerMost{
        flag: true,
        note: "text"
      }
    };
  }
}