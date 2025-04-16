// Contract with many nested optional fields
struct InnerOpt {
  x: Int?;
  y: Bool?;
  z: String?;
}

struct OuterOpt {
  foo: InnerOpt?;
  bar: InnerOpt;
}

contract NestedOptionals {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            foo: null,
            bar: InnerOpt{ x: null, y: false, z: null },
        };
    }
}