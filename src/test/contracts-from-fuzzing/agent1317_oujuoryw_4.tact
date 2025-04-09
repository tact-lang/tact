struct L2 {
    id: Int?;
    txt: String?;
    ready: Bool?;
}

struct L1 {
    innerA: L2;
    innerB: L2;
}

struct Root {
    x: L1;
    y: L1;
    finalFlag: Bool;
}

contract DeepOptionNesting {
    store: Root;

    init() {
        self.store = Root{
            x: L1{
                innerA: L2{ id: null, txt: null, ready: false },
                innerB: L2{ id: 123, txt: "abc", ready: null }
            },
            y: L1{
                innerA: L2{ id: null, txt: "def", ready: true },
                innerB: L2{ id: 999, txt: null, ready: true }
            },
            finalFlag: true
        };
    }
}
