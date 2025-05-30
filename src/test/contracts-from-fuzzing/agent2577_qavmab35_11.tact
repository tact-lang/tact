struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Address;
    f: Cell;
}

contract MixFields {
    data: Mix;

    init() {
        self.data = Mix{
            a:42,
            b:true,
            c:"hi",
            d:emptyCell().asSlice(),
            e:myAddress(),
            f:emptyCell(),
        };
    }
}
