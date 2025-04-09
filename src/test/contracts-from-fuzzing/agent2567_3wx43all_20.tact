struct NestedStrings {
  a: String;
  b: String;
}

struct Wrapper {
  nested: NestedStrings;
}

contract WrapperNested {
  w: Wrapper;

  init(){
    self.w = Wrapper{ nested: NestedStrings{a:"x",b:"y"}};
  }
}