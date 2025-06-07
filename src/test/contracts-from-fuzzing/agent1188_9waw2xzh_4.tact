struct LargeStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Bool;
    h: Int?;
    i: Int?;
    j: Bool;
}

contract ManyFields {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1, b: 2, c: 3, d: 4, e: 5,
            f: true, g: false, h: null, i: 9, j: true
        };
    }
}