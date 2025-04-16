struct WideOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
}

struct Container {
    opt: WideOptional?;
}

contract OptionalWide {
    data: Container;
    init() {
        self.data = Container{ opt: null };
    }
}