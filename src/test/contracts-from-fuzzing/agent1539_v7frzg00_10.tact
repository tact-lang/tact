struct WrapBool {
    flag: Bool;
}

struct WrapCell {
    cellData: Cell;
}

struct WrapSlice {
    sliceData: Slice;
}

struct WrapString {
    s: String;
}

contract Wrappers {
    wb: WrapBool;
    wc: WrapCell;
    ws: WrapSlice;
    wstr: WrapString;
    init() {
        self.wb = WrapBool{flag:true};
        self.wc = WrapCell{cellData: emptyCell()};
        self.ws = WrapSlice{sliceData: emptyCell().asSlice()};
        self.wstr = WrapString{s:"hi"};
    }
}