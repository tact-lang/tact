struct NestedOptional {
    a: Int?;
    b: Bool?;
}

struct Container {
    inner: NestedOptional?;
    str: String;
}

contract TestNestedOpt {
    c: Container;

    init() {
        self.c = Container{
            inner: null,
            str: "abc"
        };
    }
}
