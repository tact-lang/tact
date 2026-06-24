struct Mix {
 a: Int;
 b: Bool;
 c: String;
 d: Address;
 e: Int?;
 f: Bool?;
 g: String?;
 h: Address?;
}

contract TestContract {
  mix: Mix;

  init() {
    self.mix = Mix{
      a: 1,
      b: true,
      c: "hi",
      d: myAddress(),
      e: null,
      f: false,
      g: null,
      h: null,
    };
  }
}