struct Inner {
    x: Int;
    y: Int;
}

struct RecursiveLayer1 {
    l2: RecursiveLayer2;
}

struct RecursiveLayer2 {
    l3: RecursiveLayer3;
    f: Bool;
}

struct RecursiveLayer3 {
    payload: String?;
    nested: Inner;
}

contract Layered {
    storage: RecursiveLayer1;

    init() {
        self.storage = RecursiveLayer1{
            l2: RecursiveLayer2{
                l3: RecursiveLayer3{
                    payload: "Hi",
                    nested: Inner { x: 10, y: 42 },
                },
                f: true,
            },
        };
    }
}