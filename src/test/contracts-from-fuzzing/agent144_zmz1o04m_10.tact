struct Nested {
    a: Int;
}

struct Outer {
    nest: Nested?;
    name: String;
}

contract NullDeepNested {
    info: Outer;
    init() {
        self.info = Outer{
            nest: null,
            name: "",
        };
    }
}