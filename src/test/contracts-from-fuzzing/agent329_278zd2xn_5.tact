struct VeryLong {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
}

contract TestContract {
    longStruct: VeryLong;

    init() {
        self.longStruct = VeryLong{
            a: 1,
            b: false,
            c: "hi",
            d: 2,
            e: true,
            f: "hello",
            g: 3,
            h: false,
            i: "bye"
        };
    }
}