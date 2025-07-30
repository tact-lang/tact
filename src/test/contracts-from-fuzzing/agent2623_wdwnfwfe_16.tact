struct MultiTypeOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
}

contract TestContract {
    stuff: MultiTypeOptional;

    init() {
        self.stuff = MultiTypeOptional{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
        };
    }
}