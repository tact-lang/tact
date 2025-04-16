// Struct with mixed primitives and nested optional struct
struct Inner {
    f1: Int;
    f2: Bool;
}

struct Outer {
    s: String;
    c: Cell;
    o: Inner?;
    sl: Slice;
    a: Address;
}

contract MixedNestedOptional {
    data: Outer;
    init() {
        self.data = Outer{
            s: "hi",
            c: emptyCell(),
            o: null,
            sl: emptyCell().asSlice(),
            a: myAddress()
        };
    }
}