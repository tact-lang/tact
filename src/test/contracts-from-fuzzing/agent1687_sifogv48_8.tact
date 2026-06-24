struct NestedOptionals {
    s: String?;
    b: Bool?;
    i: Int?;
}

struct Container {
    inner: NestedOptionals;
    flag: Bool;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            inner: NestedOptionals{
                s: null,
                b: null,
                i: 42
            },
            flag: true
        };
    }
}