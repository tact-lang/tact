struct NestedOptional {
  foo: Int?;
  bar: Bool?;
}

struct Container {
  nested: NestedOptional?;
}

contract OptionalNestedOptional {
    storage: Container;
    init() {
        self.storage = Container{
            nested: null
        };
    }
}