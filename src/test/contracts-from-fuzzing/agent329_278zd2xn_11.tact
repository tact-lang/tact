struct BigStruct {
    a: Int;   b: Bool;  c: String;
    d: Int;   e: Bool;  f: String;
    g: Int;   h: Bool;  i: String;
    j: Int;   k: Bool;  l: String;
}

contract TestContract {
    bigField: BigStruct;

    init() {
        self.bigField = BigStruct{
            a: 1,
            b: true,
            c: "1",
            d: 2,
            e: false,
            f: "2",
            g: 3,
            h: true,
            i: "3",
            j: 4,
            k: false,
            l: "4",
        };
    }
}