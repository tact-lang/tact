struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
}

contract LargeStructTest {
    val: LargeStruct;

    init() {
        self.val = LargeStruct{
            a: 1,
            b: false,
            c: "a",
            d: 2,
            e: true,
            f: "b",
            g: 3,
            h: false,
            i: "c",
            j: 4
        };
    }
}