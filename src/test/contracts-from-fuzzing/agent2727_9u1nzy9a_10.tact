struct ManyNestedOptionals {
  i1: Int?; 
  s1: String?;
  nested: OptionalNested?;
}

struct OptionalNested {
  s2: String?;
  b1: Bool?;
}

contract ManyNestedOptionalsContract {
  data: ManyNestedOptionals;

  init() {
    self.data = ManyNestedOptionals{ i1: null, s1: null, nested: null };
  }
}