struct ContainsSlice {
    sl: Slice;
    val: Int;
}

contract SliceFieldStorage {
    s: ContainsSlice;

    init() {
        self.s = ContainsSlice{ sl: emptyCell().asSlice(), val: 1 };
    }
}