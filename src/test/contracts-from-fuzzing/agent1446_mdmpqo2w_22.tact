struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Top {
    inner: NestedOpt;
}

contract Test {
    data: Top;

    init() {
        self.data = Top{
            inner: NestedOpt{
                a: null,
                b: true,
                c: "txt"
            }
        };
    }
}
