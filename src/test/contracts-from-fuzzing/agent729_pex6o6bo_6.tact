struct LongStruct {
    a0: Int;
    a1: Int;
    a2: Int;
    a3: Bool;
    a4: String;
    a5: Address;
    a6: Cell;
    a7: Slice;
    a8: Builder;
    a9: Bool?;
    a10: Int;
    a11: Bool;
    a12: String;
    a13: Address;
    a14: Cell;
    a15: Slice;
    a16: Builder;
    a17: Bool?;
    a18: Int;
    a19: Bool;
}

contract WithLongStruct {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a0: 0, a1: 1, a2: 2, a3: true, a4: "hi", a5: myAddress(),
            a6: emptyCell(), a7: emptyCell().asSlice(), a8: beginCell(), a9: null,
            a10: 10, a11: false, a12: "bye", a13: myAddress(), a14: emptyCell(),
            a15: emptyCell().asSlice(), a16: beginCell(), a17: true,
            a18: 18, a19: false
        };
    }

    receive() {}
}