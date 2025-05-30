// Struct with mandatory String, optional Int, optional nested struct
struct Leaf2 {
  foo: Int;
}

struct Branch2 {
  text: String;
  optNum: Int?;
  leaf: Leaf2?;
}

contract MixOptionals {
  val: Branch2;

  init() {
    self.val = Branch2 {
      text: "hi",
      optNum: null,
      leaf: null
    };
  }
}
