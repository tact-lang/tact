struct MultiDepth {
    a: Int;
    b: Bool;
    c: DeepNested;
}

struct DeepNested {
    x: Int;
    y: Bool;
}

contract MultiDepthStorage {
    complex: MultiDepth;

    init() {
        self.complex = MultiDepth{
            a: 11,
            b: true,
            c: DeepNested{
                x: 99,
                y: false
            }
        };
    }
}