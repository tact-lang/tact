struct Final {
    s: String = "text";
    i: Int?;
}

struct Middle {
    m1: Final?;
    m2: Final = Final{ i: null };
}

struct Root {
    r1: Middle?;
    r2: Middle = Middle{};
    count: Int;
}

contract TestContract {
    data: Root;
    init() {
        self.data = Root{
            r1: null,
            count: 123
        };
    }
}