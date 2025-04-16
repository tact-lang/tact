struct LargeStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
    i: Address;
    j: Bool;
}

contract LargeFieldsContract {
    state: LargeStruct;

    init() {
        self.state = LargeStruct{
            a: 1, b: true, c: myAddress(), d: false, e: 5,
            f: true, g: 42, h: false, i: myAddress(), j: true
        };
    }
}