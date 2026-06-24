struct DeepNested {
    inner: InnerLevel;
}

struct InnerLevel {
    deeper: DeeperLevel?;
}

struct DeeperLevel {
    flag: Bool;
    count: Int;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerLevel{
                deeper: DeeperLevel{
                    flag: true,
                    count: 42,
                }
            }
        };
    }
}