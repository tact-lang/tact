struct Bottom {
    u: Int = 11;
    v: Bool = true;
}

struct Middle {
    inner: Bottom = Bottom{};
    tag: String = "hello";
}

struct Top {
    m: Middle = Middle{};
    flag: Bool = false;
}

contract Test {
    data: Top;

    init() {
        self.data = Top{
            m: Middle{
                inner: Bottom{ u: 99, v: false },
                tag: "override"
            },
            flag: true
        };
    }
}