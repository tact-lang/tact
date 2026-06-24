struct SSS {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: String = "hello";
    e: Address;
    f: Cell;
    g: Slice;
}

contract ManyTypes {
    data: SSS;

    init() {
        self.data = SSS{
            b: null,
            e: myAddress(),
            f: emptyCell(),
            g: emptyCell().asSlice(),
        };
    }
}