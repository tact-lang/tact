struct Sub {
    a: Int;
    b: Bool;
}

struct Mid {
    x: Int;
    y: Sub;
}

struct Top {
    inner: Mid;
}

contract MultiLevelComposite {
    data: Top;

    init() {
        self.data = Top{
            inner: Mid{
                x: 10,
                y: Sub{ a: 20, b: true }
            }
        };
    }
}
