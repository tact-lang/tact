struct Deep {
  nested: NestedDeep;
}

struct NestedDeep {
  val: Int;
  sub: SubNestedDeep;
}

struct SubNestedDeep {
  flag: Bool;
  innerVal: Int?;
}

contract DeepNestedTest {
  persistent: Deep;

  init() {
    self.persistent = Deep{
      nested: NestedDeep{
        val: 42,
        sub: SubNestedDeep{
          flag: true,
          innerVal: null,
        },
      },
    };
  }
}