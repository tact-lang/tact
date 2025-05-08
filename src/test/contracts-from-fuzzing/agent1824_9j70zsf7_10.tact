struct S {
    i: Int;
    b: Bool;
    c: Cell;
    a: Address;
    s: Slice;
    str: String;
}

contract SameStructMultipleTimes {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{ i: 1, b: true, c: emptyCell(), a: myAddress(), s: emptyCell().asSlice(), str: "1" };
        self.s2 = S{ i: 2, b: false, c: emptyCell(), a: myAddress(), s: emptyCell().asSlice(), str: "2" };
        self.s3 = S{ i: 3, b: true, c: emptyCell(), a: myAddress(), s: emptyCell().asSlice(), str: "3" };
    }
}
