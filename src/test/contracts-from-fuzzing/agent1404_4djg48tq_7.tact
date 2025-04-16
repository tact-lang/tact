struct Inner {
    x: Int;
    y: Bool;
}

struct Complex {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Cell;
    opt1: Int?;
    opt2: Bool?;
    nested: Inner;
    optNested: Inner?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            f1: 10,
            f2: true,
            f3: "hi",
            f4: emptyCell().asSlice(),
            f5: emptyCell(),
            opt1: null,
            opt2: null,
            nested: Inner{ x: 1, y: false },
            optNested: null
        };
    }
}