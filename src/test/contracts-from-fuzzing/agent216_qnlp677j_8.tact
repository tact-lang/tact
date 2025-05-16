struct LargeNested {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
    inner4: Inner;
}

struct Inner {
    num: Int;
    flag: Bool;
    text: String;
    addr: Address;
    slice: Slice;
    cell: Cell;
    optNum: Int?;
    optFlag: Bool?;
    optText: String?;
    optAddr: Address?;
    optSlice: Slice?;
    optCell: Cell?;
}

contract ComplexNested {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            inner1: Inner{ num: 1, flag: true, text: "a", addr: myAddress(), slice: emptyCell().asSlice(), cell: emptyCell(), optNum: null, optFlag: null, optText: null, optAddr: null, optSlice: null, optCell: null },
            inner2: Inner{ num: 2, flag: false, text: "b", addr: myAddress(), slice: emptyCell().asSlice(), cell: emptyCell(), optNum: null, optFlag: null, optText: null, optAddr: null, optSlice: null, optCell: null },
            inner3: Inner{ num: 3, flag: true, text: "c", addr: myAddress(), slice: emptyCell().asSlice(), cell: emptyCell(), optNum: null, optFlag: null, optText: null, optAddr: null, optSlice: null, optCell: null },
            inner4: Inner{ num: 4, flag: false, text: "d", addr: myAddress(), slice: emptyCell().asSlice(), cell: emptyCell(), optNum: null, optFlag: null, optText: null, optAddr: null, optSlice: null, optCell: null }
        };
    }
}