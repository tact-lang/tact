struct BigStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Bool;
    f: Bool;
    g: String;
    h: Slice;
    i: Address;
    j: Bool;
    k: Int;
    l: Bool;
    m: String;
    n: Address;
}

contract ManyFields {
    state: BigStruct;

    init() {
        self.state = BigStruct{
            a: 1, b: 2, c: 3, d: 4, e: true, f: false, g: "hi",
            h: emptyCell().asSlice(), i: myAddress(), j: false,
            k: 42, l: true, m: "bye", n: myAddress()
        };
    }
}