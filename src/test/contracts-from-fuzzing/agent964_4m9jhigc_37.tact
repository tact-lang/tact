struct Mid {
  level: Int;
}

struct Outermost {
  middle: Mid;
}

contract DeepStruct {
  data: Outermost;

  init() {
    self.data = Outermost{
      middle: Mid{level:123}
    };
  }
}
