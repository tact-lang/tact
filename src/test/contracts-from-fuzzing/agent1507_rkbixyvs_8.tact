struct Layer3 {
  v3: Int;
  note3: String;
}

struct Layer2 {
  v2: Int;
  note2: String;
  l3: Layer3;
}

struct Layer1 {
  v1: Int;
  note1: String;
  l2: Layer2;
}

contract TripleNested {
  top: Layer1;

  init() {
    self.top = Layer1{
      v1: 11,
      note1: "one",
      l2: Layer2{
        v2: 22,
        note2: "two",
        l3: Layer3{
          v3: 33,
          note3: "three"
        }
      }
    };
  }
}
