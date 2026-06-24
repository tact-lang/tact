// deeply nested optional == optional of optional struct field (NOT nested optionals!)
// aka optional nested struct, inner has optionals but no nested optionals
struct Bottom {
  num: Int?;
}
struct Mid {
  inner: Bottom?;
}
struct Top {
  m: Mid?;
}

contract OptionalStructs {
  val: Top?;

  init() {
    self.val = Top{
      m: Mid{
        inner: Bottom{
          num: 123
        }
      }
    };
  }
}