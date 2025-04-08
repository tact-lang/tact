struct Deep2 {
  val2: Int;
}

struct Deep1 {
  dep: Deep2;
}

contract DeepNested {
  field: Deep1;

  init() {
    self.field = Deep1{
      dep: Deep2{
        val2: 5,
      },
    };
  }
}