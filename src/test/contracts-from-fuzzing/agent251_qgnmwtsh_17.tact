struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract NestedOptionalTest {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            a: null,
            b: null,
            c: null
        };
    }
}