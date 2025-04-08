struct DeepNested {
    inner: InnerLevel;
}

struct InnerLevel {
    deeper: DeeperLevel;
}

struct DeeperLevel {
    flag: Bool;
    maybeNum: Int?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerLevel{
                deeper: DeeperLevel{
                    flag: true,
                    maybeNum: null,
                },
            },
        };
    }
}