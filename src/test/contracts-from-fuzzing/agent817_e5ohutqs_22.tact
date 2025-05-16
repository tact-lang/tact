struct NestedOptional {
    a: Int?;
    b: Bool?;
}

struct Container {
    inner: NestedOptional?;
    flag: Bool;
}

contract Test {
    c: Container;

    init() {
        self.c = Container {
            inner: null,
            flag: true
        };
    }
}