struct Sub {
    a: Int as uint16;
    b: Bool;
    c: String;
    d: Slice;
}

struct Top {
    one: Sub;
    two: Sub;
    three: Sub;
}

contract TestContract {
    nested: Top;

    init() {
        let subInstance = Sub{
            a: 12,
            b: false,
            c: "hi there",
            d: emptyCell().asSlice()
        };
        self.nested = Top{
            one: subInstance,
            two: subInstance,
            three: subInstance
        };
    }
}