struct OptionalChain {
    a: Int?;
    b: Inner1?;
}

struct Inner1 {
    c: Bool?;
    d: Inner2?;
}

struct Inner2 {
    e: String?;
    f: Address?;
    g: Inner3?;
}

struct Inner3 {
    h: Slice?;
    i: Cell?;
}

contract OptionalChainStorage {
    data: OptionalChain;

    init() {
        self.data = OptionalChain{
            a: null,
            b: null,
        };
    }
}