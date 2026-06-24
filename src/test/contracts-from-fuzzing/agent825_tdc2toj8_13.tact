struct ManyOptionalsNested {
    a: Int?;
    b: Bool?;
    c: String?;
    d: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: String?;
}

contract OptNestedTest {
    m: ManyOptionalsNested;

    init() {
        self.m = ManyOptionalsNested{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}