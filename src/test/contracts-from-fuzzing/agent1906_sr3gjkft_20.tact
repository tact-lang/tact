// Contract with persistent field initialized with a struct having optional nested struct

struct Nested {
    n: Int;
    b: Bool;
}

struct Container {
    nested: Nested?;
}

contract WeirdWeak {
    value: Container;

    init() {
        self.value = Container{
            nested: null
        };
    }
}
