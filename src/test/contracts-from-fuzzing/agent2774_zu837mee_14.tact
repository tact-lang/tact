// nested structs containing optional fields with explicit serialization
struct Embed {
  small: Int as uint8;
  optInt: Int?;
  optBool: Bool?;
}

contract TestContract {
  val: Embed;

  init() {
    self.val = Embed{
      small: 15,
      optInt: null,
      optBool: true
    };
  }
}