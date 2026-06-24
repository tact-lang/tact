struct InnerOptional {
    x: Int?;
    y: String?;
}

struct MidOptional {
    inner: InnerOptional?;
    b: Bool;
}

contract NestedOptContract {
    data: MidOptional;

    init() {
        self.data = MidOptional{
            inner: null,
            b: true
        };
    }
}
