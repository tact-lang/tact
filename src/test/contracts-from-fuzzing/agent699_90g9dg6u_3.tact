struct Layer3 { f1: Int; f2: Bool; f3: String; f4: Bool?; }
struct Layer2 { s1: String; inner: Layer3; s2: Bool?; }
struct Layer1 { id: Int; nested: Layer2; flag: Bool; note: String?; }

contract OptionalNest {
  data: Layer1;

  init() {
    self.data = Layer1{
      id: 7,
      nested: Layer2{
        s1: "level2",
        inner: Layer3{
          f1: 3,
          f2: true,
          f3: "level3",
          f4: null
        },
        s2: null
      },
      flag: true,
      note: null
    };
  }
}
