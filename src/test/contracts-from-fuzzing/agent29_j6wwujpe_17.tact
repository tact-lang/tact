struct OptAddr {
    a: Address?;
    b: Int;
}
struct OptSlice {
    s: Slice?;
    b: Bool;
}
struct OptCell {
    c: Cell?;
    s: String;
}

contract OptDifferentTypes {
    addrOpt: OptAddr;
    sliceOpt: OptSlice;
    cellOpt: OptCell;

    init() {
        self.addrOpt = OptAddr{a:null,b:1};
        self.sliceOpt = OptSlice{s:null,b:true};
        self.cellOpt = OptCell{c:null,s:"abc"};
    }
}