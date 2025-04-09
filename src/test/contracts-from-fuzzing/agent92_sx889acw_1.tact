struct NestedStructLevel3 { val3: Int; }

struct NestedStructLevel2 {
  nested3: NestedStructLevel3;
  optVal3: Int?;
}

struct NestedStructLevel1 {
  nested2: NestedStructLevel2;
  optVal2: Int?;
}

contract DeepNestedTest {
  nested1: NestedStructLevel1;

  init() {
    self.nested1 = NestedStructLevel1{
      nested2: NestedStructLevel2{
        nested3: NestedStructLevel3{ val3: 3 },
        optVal3: null
      },
      optVal2: null
    };
  }
}