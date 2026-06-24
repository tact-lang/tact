struct InnerLevel {
    deepInt: Int;
    deepBool: Bool;
}

struct MidLevel {
    inner: InnerLevel;
    midValue: Int;
}

struct TopLevel {
    mid: MidLevel;
    topValue: Bool;
}

contract TestContract {
    storage: TopLevel;

    init() {
        self.storage = TopLevel{
            mid: MidLevel{
                inner: InnerLevel{
                    deepInt: 7,
                    deepBool: false
                },
                midValue: 3
            },
            topValue: true
        };
    }

    receive() {
        self.storage = self.storage;
    }
}