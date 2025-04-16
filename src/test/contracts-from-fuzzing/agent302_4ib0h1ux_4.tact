struct Layer1 {
  optInner: Layer2?;
}

struct Layer2 {
  flag: Bool;
  txt: String;
}

contract OptionalNested {
  val: Layer1;

  init() {
    self.val = Layer1{
      optInner: null
    };
  }
}
