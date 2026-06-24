struct Large {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: String;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
}

contract TestContract {
    bigStruct: Large;

    init() {
        self.bigStruct = Large{
            a: 1, b: true, c: 3, d: false,
            e: "abc", f: true, g: 7,
            h: "def", i: false, j: 10
        };
    }
}