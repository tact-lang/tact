struct Bottom {
    a: Int?;
    b: Bool?;
}

struct Mid {
    x: Bottom?;
    y: Int?;
}

struct Top {
    m: Mid?;
    n: Bool?;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            m: Mid{
                x: Bottom{
                    a: null,
                    b: true
                },
                y: 42
            },
            n: false
        };
    }
}