struct Outermost {
    inner1: Int;
    inner2: InnerNested?;
}

struct InnerNested {
    x: Int;
    y: Int?;
}

contract OptionalTree {
    data: Outermost;

    init() {
        self.data = Outermost{
            inner1: 7,
            inner2: InnerNested{ x: 10, y: null }
        };
    }
}
