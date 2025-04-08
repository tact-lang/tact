struct LargeStruct {
    a0: Int;
    a1: Bool;
    a2: String;
    a3: Cell;
    a4: Slice;
    a5: Address;
    a6: Int;
    a7: Bool;
    a8: String;
    a9: Cell;
    a10: Slice;
    a11: Address;
    a12: Int;
    a13: Bool;
    a14: String;
    a15: Cell;
    a16: Slice;
    a17: Address;
    a18: Int;
    a19: Bool;
    a20: String;
    a21: Cell;
    a22: Slice;
    a23: Address;
}

contract TestContract {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a0: 1, a1: true, a2: "x", a3: emptyCell(), a4: emptyCell().asSlice(), a5: myAddress(),
            a6: 2, a7: false, a8: "y", a9: emptyCell(), a10: emptyCell().asSlice(), a11: myAddress(),
            a12: 3, a13: true, a14: "z", a15: emptyCell(), a16: emptyCell().asSlice(), a17: myAddress(),
            a18: 4, a19: false, a20: "w", a21: emptyCell(), a22: emptyCell().asSlice(), a23: myAddress()
        };
    }

    receive() {}
}