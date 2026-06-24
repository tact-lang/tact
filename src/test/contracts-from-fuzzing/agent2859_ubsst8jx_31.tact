struct DeeplyNested {
  s: Deep2;
}

struct Deep2 {
  s: Deep3;
}

struct Deep3 {
  s: Deep4;
}

struct Deep4 {
  s: Deep5;
}

struct Deep5 {
  s: Deep6;
}

struct Deep6 {
  s: Deep7;
}

struct Deep7 {
  value: Int;
}

contract DeepWrap {
  data: DeeplyNested;

  init() {
    self.data = DeeplyNested{
      s: Deep2{ s: Deep3{ s: Deep4{ s: Deep5{ s: Deep6{ s: Deep7{ value:123 } } } } } }
    };
  }
}