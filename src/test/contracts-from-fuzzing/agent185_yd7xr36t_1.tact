struct DeepNested {
    a: Int;
    b: InnerLevel;
}

struct InnerLevel {
    c: Int;
    d: DeeperLevel;
}

struct DeeperLevel {
    e: Int;
    f: String;
    g: Bool?;
}

contract TestContract {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            a: 1,
            b: InnerLevel{
                c: 2,
                d: DeeperLevel{
                    e: 3,
                    f: "hello",
                    g: true
                }
            }
        };
    }
}
