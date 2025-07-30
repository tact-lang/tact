struct NestedOptional {
    x: Int?;
    y: Bool?;
}

struct Wrap {
    inner: NestedOptional?;
}

contract Test {
    data: Wrap;
    init() {
        self.data = Wrap{
            inner: null
        };
    }
}