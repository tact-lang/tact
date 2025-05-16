struct MultiLevel {
    first: Second;
}

struct Second {
    inner: Third;
}

struct Third {
    flag: Bool;
    count: Int;
}

contract TestContract {
    s: MultiLevel;

    init() {
        self.s = MultiLevel{
            first: Second{
                inner: Third{
                    flag: true,
                    count: 999
                }
            }
        };
    }
}