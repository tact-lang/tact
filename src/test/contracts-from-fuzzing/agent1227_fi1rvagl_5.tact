struct Nested {
    x: Int;
    y: Bool;
}

struct Info {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    nested: Nested;
}

contract AllTypes {
    data: Info;

    init() {
        self.data = Info{
            a: 7,
            b: false,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hey",
            nested: Nested{ x:1, y:true }
        };
    }
}
