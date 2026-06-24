struct NestedOptional {
    a: Int?;
    b: String?;
}

struct Container {
    inner: NestedOptional?;
    count: Int;
}

contract Test8 {
    data: Container;

    init() {
        self.data = Container{ inner: null, count: 0 };
    }
}