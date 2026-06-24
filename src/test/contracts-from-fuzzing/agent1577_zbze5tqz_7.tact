struct BigOne {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Address;
    corge: Cell;
    grault: Slice;
    garply: Builder;
    waldo: Int?;
    fred: Bool?;
    plugh: String?;
    xyzzy: Address?;
    thud: Cell?;
}

contract TestContract {
    data: BigOne;
    init() {
        self.data = BigOne{
            foo: 1,
            bar: true,
            baz: "hi",
            qux: myAddress(),
            corge: emptyCell(),
            grault: emptyCell().asSlice(),
            garply: beginCell(),
            waldo: null,
            fred: null,
            plugh: null,
            xyzzy: null,
            thud: null
        };
    }
}