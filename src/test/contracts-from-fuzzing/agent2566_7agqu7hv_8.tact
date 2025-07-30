struct Combo {
  integer: Int;
  boolean: Bool;
  text: String;
}

contract MultiType {
  data: Combo;

  init() {
    self.data = Combo{
      integer: 99,
      boolean: true,
      text: "sample"
    };
  }
}
