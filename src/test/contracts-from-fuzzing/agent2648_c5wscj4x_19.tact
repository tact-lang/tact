struct InnerS {
  v1: Int;
  v2: Bool;
  v3: String;
  v4: Int?;
}

struct OuterS {
  inner1: InnerS?;
  inner2: InnerS?;
  inner3: InnerS?;
}

contract ManyOptionals {
  inside: OuterS;

  init() {
    self.inside = OuterS{
      inner1: null,
      inner2: null,
      inner3: null
    };
  }
}