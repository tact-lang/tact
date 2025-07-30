struct StructWithSlice {
    data: Slice;
    flag: Bool;
}

contract TestContract {
    s: StructWithSlice;
    init() {
        self.s = StructWithSlice{ data: emptyCell().asSlice(), flag:true };
    }
}