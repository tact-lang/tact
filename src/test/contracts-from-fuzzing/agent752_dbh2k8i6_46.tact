struct OptionalStrNested {
  foo: String?;
}

struct Container {
  bar: OptionalStrNested?;
}

contract OptNestedString {
    val: Container;

    init() {
        self.val = Container{ bar: null };
    }
}