struct LargeStruct {
    i1: Int;
    i2: Int?;
    b1: Bool;
    b2: Bool?;
    c1: Cell;
    c2: Cell?;
    a1: Address;
    a2: Address?;
    s1: String;
    s2: String?;
    i3: Int;
    b3: Bool;
    c3: Cell;
    a3: Address;
    s3: String;
}

contract TestContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            i1: 1,
            i2: null,
            b1: true,
            b2: null,
            c1: emptyCell(),
            c2: null,
            a1: myAddress(),
            a2: null,
            s1: "hi",
            s2: null,
            i3: 2,
            b3: false,
            c3: emptyCell(),
            a3: myAddress(),
            s3: "bye",
        };
    }
}