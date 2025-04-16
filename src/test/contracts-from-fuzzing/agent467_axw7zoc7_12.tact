struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
    g: S?;
}

struct S {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    content: DeeplyOptional;

    init() {
        self.content = DeeplyOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
        };
    }
}