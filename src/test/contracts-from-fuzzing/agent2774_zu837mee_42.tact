// mixture of serialization tags and optionals in same struct
struct Combo {
  a: Int as uint8;
  b: Bool?;
  c: Int?;
  d: String;
  e: Address?;
}

contract TestContract {
  val: Combo;

  init() {
    self.val = Combo{
      a:5,
      b:null,
      c:null,
      d:"yo",
      e:null
    };
  }
}