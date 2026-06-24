struct InnerOption {
  v1: Int?;
  v2: Bool?;
}

struct OuterOption {
  inner: InnerOption?;
}

contract NestedNullable {
  data: OuterOption;

  init() {
    self.data = OuterOption{ inner: InnerOption{ v1:null, v2:true } };
  }
}