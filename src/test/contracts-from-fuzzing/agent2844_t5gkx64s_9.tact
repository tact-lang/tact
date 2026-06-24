struct Mix {
  a: Bool;
  b: String;
  c: Address;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Address?;
}

contract TestContract {
  m: Mix;

  init() {
    self.m = Mix{
      a: false,
      b: "hello",
      c: myAddress(),
      d: null,
      e: null,
      f: null,
      g: null
    };
  }
}