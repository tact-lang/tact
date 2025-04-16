struct BigNested {
    x1: Int;
    x2: Bool;
    x3: Int?;
    x4: Bool?;
    x5: String;
    x6: String?;
    x7: Address;
    x8: Address?;
    x9: Cell;
    x10: Cell?;
    x11: Slice;
    x12: Slice?;
}

contract ManyNestedStructs {
    a: BigNested;
    b: BigNested;
    c: BigNested;

    init() {
        self.a = BigNested{
            x1: 1, x2: true, x3: null, x4: null, x5: "a", x6: null,
            x7: myAddress(), x8: null, x9: emptyCell(), x10: null,
            x11: emptyCell().asSlice(), x12: null
        };
        self.b = self.a;
        self.c = self.a;
    }
}