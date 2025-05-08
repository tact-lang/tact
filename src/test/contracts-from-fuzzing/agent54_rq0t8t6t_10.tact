struct LargeNested {
    nested: NestedInside;
}

struct NestedInside {
    sub1: Int;
    sub2: Bool;
    sub3: String;
    sub4: Cell;
    sub5: Slice;
    sub6: Address;
    sub7: Int?;
    sub8: Bool?;
    sub9: String?;
}

contract LargeNestedContract {
    record: LargeNested;

    init() {
        self.record = LargeNested{
            nested: NestedInside{
                sub1: 1,
                sub2: true,
                sub3: "x",
                sub4: emptyCell(),
                sub5: emptyCell().asSlice(),
                sub6: myAddress(),
                sub7: null,
                sub8: false,
                sub9: null
            }
        };
    }
}