struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool?;
    h: Int?;
    i: String;
    j: Bool;
}

contract TestContract {
    state: BigStruct;

    init() {
        self.state = BigStruct{
            a: 1, b: true, c: "hi", d: emptyCell(), e: emptyCell().asSlice(),
            f: myAddress(), g: null, h: 2, i: "hello", j: false
        };
    }
}