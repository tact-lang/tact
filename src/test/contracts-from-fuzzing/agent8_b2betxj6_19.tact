struct OnlyOptional {
  val: Int?;
}

contract OptionalNoInit {
  data: OnlyOptional;

  init() {
    self.data = OnlyOptional{ val: null };
  }
}