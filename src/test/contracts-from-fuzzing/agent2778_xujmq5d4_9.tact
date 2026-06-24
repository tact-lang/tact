struct OptionalStruct {
  opt: Int?;
}

struct Container {
  val1: OptionalStruct;
  val2: OptionalStruct;
  val3: OptionalStruct;
}

contract OptionalStructContract {
  data: Container;

  init() {
    self.data = Container{
      val1: OptionalStruct{opt: null},
      val2: OptionalStruct{opt: 5},
      val3: OptionalStruct{opt: null},
    };
  }
}
