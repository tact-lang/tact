struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Bool;
    l: String;
    m: Int?;
    n: Bool?;
    o: String;
}

contract LargeContract {
    field1: LargeStruct;
    field2: LargeStruct;

    init() {
        let example = LargeStruct{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: false,
            f: "f",
            g: 7,
            h: false,
            i: "i",
            j: 10,
            k: true,
            l: "l",
            m: null,
            n: false,
            o: "o",
        };
        self.field1 = example;
        self.field2 = example;
    }

    receive() {}
}