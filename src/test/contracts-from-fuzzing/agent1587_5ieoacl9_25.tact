struct TripleNested {
  inner: InnerStruct;
}

struct InnerStruct {
  deep: DeepStruct;
}

struct DeepStruct {
  flag: Bool;
  comment: String;
}

contract TNTest {
  tn: TripleNested;

  init() {
    self.tn = TripleNested{
      inner: InnerStruct{
        deep: DeepStruct{
          flag: true,
          comment: "abc",
        }
      }
    };
  }
}