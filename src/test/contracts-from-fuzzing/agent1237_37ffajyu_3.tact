struct InnerLevel {
    alpha: Int;
    beta: Bool;
}

struct MiddleLevel {
    inner: InnerLevel;
    flag: Bool;
}

struct OuterLevel {
    middle: MiddleLevel;
    id: Int;
}

contract Test3 {
    data: OuterLevel;

    init() {
        self.data = OuterLevel{
            middle: MiddleLevel{
                inner: InnerLevel{
                    alpha: 5,
                    beta: false
                },
                flag: true
            },
            id: 42
        };
    }
}