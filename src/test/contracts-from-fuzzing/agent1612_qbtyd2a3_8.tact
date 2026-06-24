struct L4 {
    deepNum: Int;
    deepText: String;
}

struct L3 {
    l3field1: String?;
    l3field2: L4;
}

struct L2 {
    l2field1: Bool;
    l2field2: L3;
}

struct BigNested {
    level1: Int;
    level2: L2;
}

contract TestContract {
    storage: BigNested;

    init() {
        self.storage = BigNested{
            level1: 12,
            level2: L2{
                l2field1: true,
                l2field2: L3{
                    l3field1: null,
                    l3field2: L4{
                        deepNum: 99,
                        deepText: "deep",
                    },
                },
            },
        };
    }

    receive() {
        let _ = self.storage.level1;
    }
}