struct Deep {
  val1: Int;
  val2: Int?;
  val3: Bool;
  val4: Bool?;
  val5: String;
  val6: String;
}

struct Wrap {
  inner: Deep;
}

contract NestedOptional {
  x: Wrap?;

  init() {
    self.x = Wrap{
      inner: Deep{
        val1: 3,
        val2: null,
        val3: true,
        val4: false,
        val5: "A",
        val6: "B"
      }
    };
  }
}