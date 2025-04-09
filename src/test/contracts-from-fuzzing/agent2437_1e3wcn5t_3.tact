struct Deep1 { val1: Int; opt1: Bool?; }
struct Deep2 { s1: Deep1; opt2: String?; }
struct Deep3 { s2: Deep2; opt3: Cell?; }

contract DeepNesting {
  data: Deep3;

  init() {
    self.data = Deep3{
      s2: Deep2{
        s1: Deep1{
          val1: 5,
          opt1: false,
        },
        opt2: "deepstr",
      },
      opt3: emptyCell(),
    };
  }
}