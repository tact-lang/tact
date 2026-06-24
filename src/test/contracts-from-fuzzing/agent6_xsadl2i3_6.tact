struct NestedOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Wrap {
    inner: NestedOptional?;
}

contract OptContract {
    data: Wrap;
    init() {
        self.data = Wrap{
            inner: null,
        };
    }
}