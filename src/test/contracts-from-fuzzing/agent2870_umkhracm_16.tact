struct LongNested {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: String;
}

contract Test {
    x1: LongNested;
    x2: LongNested;
    x3: LongNested;

    init() {
        self.x1 = LongNested{ a:1, b:true, c:myAddress(), d:emptyCell().asSlice(), e:"one" };
        self.x2 = LongNested{ a:2, b:false, c:myAddress(), d:emptyCell().asSlice(), e:"two" };
        self.x3 = LongNested{ a:3, b:true, c:myAddress(), d:emptyCell().asSlice(), e:"three" };
    }
}
