struct LargeStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Bool?;
    f: Int?;
    g: String;
}

contract LargeFields {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a: 12,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: false,
            f: null,
            g: "hello"
        };
    }
}