struct LargeNested {
    inner1: Int = 1;
    inner2: Bool = true;
    inner3: String = "abc";
    inner4: Cell; 
    inner5: Slice;
    inner6: Address;
}

struct OuterLarge {
    n1: LargeNested;
    n2: LargeNested;
    n3: LargeNested;
    n4: LargeNested;
    n5: LargeNested;
}

contract DeepWide {
    data: OuterLarge;
    init() {
        let n = LargeNested{
            inner1: 1,
            inner2: true,
            inner3: "abc",
            inner4: emptyCell(),
            inner5: emptyCell().asSlice(),
            inner6: myAddress(),
        };
        self.data = OuterLarge{
            n1: n,
            n2: n,
            n3: n,
            n4: n,
            n5: n,
        };
    }
}