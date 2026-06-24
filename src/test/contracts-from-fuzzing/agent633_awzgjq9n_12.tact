struct Layer3 {
  val3: Int;
}

struct Layer2 {
  mid: Layer3;
}

struct Layer1 {
  mid: Layer2;
}

struct TopOptions {
  deep: Layer1?;
}

contract DeepOptionalContract {
  content: TopOptions;

  init() {
    self.content = TopOptions{ deep: null };
  }
}
