struct DeeplyNested {
  lvl1: String;
  lvl2: Inner2;
}

struct Inner2 {
  lvl3: Inner3;
}

struct Inner3 {
  num: Int;
  flag: Bool?;
}

contract StructLayer {
  data: DeeplyNested;

  init() {
    self.data = DeeplyNested {
      lvl1: "hi",
      lvl2: Inner2 {
        lvl3: Inner3 { num: 5, flag: null }
      }
    };
  }
}