struct DeepNested {
    a: Int?;
    b: Int?;
    c: DeeperNested;
}

struct DeeperNested {
    q: Int;
    r: Int?;
}

contract TestContract {
    data: DeepNested;
    init() {
        self.data = DeepNested {
            a: null,
            b: 2,
            c: DeeperNested {
                q: 1,
                r: null,
            },
        };
    }
}
