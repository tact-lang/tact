struct DeepNested {
  val: Int;
  next: NextLevel;
}

struct NextLevel {
  flag: Bool;
  inner: InnerLevel;
}

struct InnerLevel {
  data: Int?;
}

contract DeepContract {
  state: DeepNested;

  init() {
    self.state = DeepNested{
      val: 5,
      next: NextLevel{
        flag: true,
        inner: InnerLevel{
          data: null,
        },
      },
    };
  }
}