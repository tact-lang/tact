struct InnerOne {
    a: Int?;
}

struct InnerTwo {
    b: Bool?;
}

struct Combine {
    x: InnerOne;
    y: InnerTwo;
    s: String;
    c: Cell?;
    d: Slice;
}

contract Combination {
    combined: Combine;

    init() {
        self.combined = Combine{
            x: InnerOne{a: null},
            y: InnerTwo{b: null},
            s: "hi",
            c: null,
            d: emptyCell().asSlice(),
        };
    }
}
