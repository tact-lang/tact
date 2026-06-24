struct NestedOptional {
    s: String?;
}

struct Container {
    inner: NestedOptional;
    flag: Bool;
}

contract NestedOptionalStructField {
    data: Container;

    init() {
        self.data = Container{
            inner: NestedOptional{ s: null },
            flag: true
        };
    }
}