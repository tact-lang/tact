struct MixPrimitives {
    intf: Int;
    boolf: Bool;
    addr: Address;
    cf: Cell;
    sf: Slice;
    strf: String;
}

contract MixPrimitivesContract {
    data: MixPrimitives;

    init() {
        self.data = MixPrimitives{
            intf: 1,
            boolf: false,
            addr: myAddress(),
            cf: emptyCell(),
            sf: emptyCell().asSlice(),
            strf: "hello"
        };
    }
}