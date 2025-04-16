struct OptStruct {
  a: Int?;
  b: String?;
  c: Bool?;
}

struct Container {
  inner1: OptStruct;
  inner2: OptStruct;
}

contract OptionalNested {
    val: Container;

    init() {
        self.val = Container{
            inner1: OptStruct{a: 1, b: null, c: true},
            inner2: OptStruct{a: null, b: "hi", c: false}
        };
    }
}