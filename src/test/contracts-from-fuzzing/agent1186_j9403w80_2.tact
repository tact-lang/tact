struct LargeStruct {
    a1: Int;
    a2: Bool;
    a3: Bool?;
    a4: String;
    a5: String?;
    a6: Cell;
    a7: Cell?;
    a8: Slice;
    a9: Slice?;
    a10: Builder;
    a11: Builder?;
    a12: Address;
    a13: Address?;
    a14: Int;
    a15: Bool;
    a16: Bool?;
    a17: String;
    a18: String?;
    a19: Cell;
    a20: Slice;
}

contract LargeStructContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a1: 1,
            a2: true,
            a3: null,
            a4: "foo",
            a5: null,
            a6: emptyCell(),
            a7: null,
            a8: emptyCell().asSlice(),
            a9: null,
            a10: beginCell(),
            a11: null,
            a12: myAddress(),
            a13: null,
            a14: 2,
            a15: false,
            a16: true,
            a17: "bar",
            a18: null,
            a19: emptyCell(),
            a20: emptyCell().asSlice(),
        };
    }
}
