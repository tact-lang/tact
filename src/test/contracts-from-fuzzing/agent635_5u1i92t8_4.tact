struct ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
}

contract ManyStructFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1, b: true, c: myAddress(), d: emptyCell(), e: emptyCell().asSlice(),
            f: false, g: 10, h: "hello", i: true, j: 999
        };
    }
}