struct HasString {
  s: String;
}

struct HasBool {
  b: Bool;
}

struct Wrap {
  inner1: HasString;
  inner2: HasBool;
}

contract MultiStructTypes {
  field: Wrap;

  init() {
    self.field = Wrap{
      inner1: HasString{ s: "hello" },
      inner2: HasBool{ b: true }
    };
  }
}