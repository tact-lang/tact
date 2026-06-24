struct Strange {
    x1: Int as int8;
    x2: Int as uint4;
    x3: Bool;
    x4: Address;
    x5: Cell;
    x6: Slice;
    x7: Builder;
    x8: String;
    x9: Int?;
    x10: Address?;
}

contract Weird {
    s: Strange;

    init() {
        self.s = Strange {
            x1:1, x2:2, x3:true, x4: myAddress(),
            x5: emptyCell(), x6: emptyCell().asSlice(), x7: beginCell(),
            x8: "hello", x9: null, x10: null
        };
    }
}