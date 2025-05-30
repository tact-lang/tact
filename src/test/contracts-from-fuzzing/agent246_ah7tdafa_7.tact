struct LargeNested {
    a: InnerLarge;
}

struct InnerLarge {
    b1: Int;
    b2: Bool;
    b3: String;
    b4: Address;
    b5: Cell;
    b6: Bool?;
    b7: Int?;
    b8: String;
    b9: Address;
}

contract TestLargeNested {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a: InnerLarge{
                b1: 1,
                b2: true,
                b3: "str",
                b4: myAddress(),
                b5: emptyCell(),
                b6: null,
                b7: null,
                b8: "hello",
                b9: myAddress()
            }
        };
    }
}