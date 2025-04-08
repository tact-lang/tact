struct DeeplyNestedOptionalStruct {
  foo: Option1?;
}

struct Option1 {
  foo: Option2?;
}

struct Option2 {
  foo: Option3?;
}

struct Option3 {
  x: Int;
}

contract DeepOptStructContract {
  data: DeeplyNestedOptionalStruct;

  init() {
    self.data = DeeplyNestedOptionalStruct{foo: null};
  }
}