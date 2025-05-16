struct Inner {
    s: String;
    c: Cell;
}

struct Outer {
    optIn: Inner?;
    num: Int;
}

contract OptionalStructWithNested {
    data: Outer;

    init() {
        self.data = Outer{
            optIn: null,
            num: 55
        };
    }
}