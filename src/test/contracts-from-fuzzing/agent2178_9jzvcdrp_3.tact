struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool;
    i: Int;
    j: Bool;
}

contract LargeFieldsContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1, b: true, c: null, d: false,
            e: 5, f: true, g: null, h: false,
            i: 9, j: true
        };
    }
}