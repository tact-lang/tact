struct OptLevel3 {
  val3: Int;
}

struct OptLevel2 {
  val2: OptLevel3?;
}

struct OptLevel1 {
  val1: OptLevel2?;
}

contract OptionalNesting {
  nested: OptLevel1;

  init() {
    self.nested = OptLevel1{
      val1: OptLevel2{
        val2: OptLevel3{val3: 999},
      }
    };
  }
}