struct Flat {
    a1: Int as uint32;
    a2: Int as int64;
    a3: Bool;
    a4: String?;
    a5: Address;
    a6: Cell;
    a7: Slice;
    a8: Int;
    a9: Bool?;
    a10: String;
}

contract TestContract {
    data: Flat;

    init() {
        self.data = Flat{
            a1: 1,
            a2: -64,
            a3: false,
            a4: null,
            a5: myAddress(),
            a6: emptyCell(),
            a7: emptyCell().asSlice(),
            a8: 256,
            a9: null,
            a10: "final",
        };
    }

    receive() {
        let _ = self.data.a8;
    }
}