struct NestedOne {
  val: Int;
}

struct NestedTwo {
  nest1: NestedOne;
  val2: Int;
}

struct NestedThree {
  nest2: NestedTwo;
  val3: Int;
}

struct NestedFour {
  nest3: NestedThree;
  val4: Int;
}

contract DeepChain {
  data: NestedFour;

  init() {
    self.data = NestedFour{
      nest3: NestedThree{
        nest2: NestedTwo{
          nest1: NestedOne{ val: 5 },
          val2: 6
        },
        val3: 7
      },
      val4: 8
    };
  }
}