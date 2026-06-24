struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Slice?;
    l: Cell?;
}

contract TestContract {
    optField: ManyOptionals;

    init() {
        self.optField = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: 7,
            h: true,
            i: "s",
            j: myAddress(),
            k: emptyCell().asSlice(),
            l: emptyCell(),
        };
    }

    receive() {
        let s = self.optField.i;
    }
}