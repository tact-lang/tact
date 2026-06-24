struct Mix {
    a: Int;
    b: Bool;
    c: Bool?;
    d: String;
    e: Slice;
    f: Cell;
    g: Address;
}

contract TestMix {
    s: Mix;

    init() {
        self.s = Mix{
            a:1, b:true, c: null,
            d:"hi", e: emptyCell().asSlice(),
            f: emptyCell(), g: myAddress()
        };
    }
}