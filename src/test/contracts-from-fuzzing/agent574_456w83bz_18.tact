// complex interaction: persistent optionals, nested structs, some defaults
struct Bottom {
  x: Int = 1;
  y: Bool?;
}

struct Middle {
  b: Bottom?;
  label: String;
}

contract MixNestedOptionalDefaults {
  m: Middle;

  init() {
    self.m = Middle{ b: null, label: "hi" };
  }
}