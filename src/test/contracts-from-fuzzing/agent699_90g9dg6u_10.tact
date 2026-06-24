struct InnerOne { a: Int; opt: Bool?; }
struct InnerTwo { s: String; inner: InnerOne; }
struct Container {
  first: Int;
  deep: InnerTwo;
  last: String?;
}

contract NestedOptional {
    state: Container;

    init() {
        self.state = Container{
            first: 1,
            deep: InnerTwo{
                s: "nest",
                inner: InnerOne{
                    a: 42,
                    opt: null
                }
            },
            last: null
        };
    }
}
