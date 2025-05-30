struct BigStruct {
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
    k: Bool;
    l: String;
}

contract ManyFieldsStorage {
    storageField: BigStruct;

    init() {
        self.storageField = BigStruct{
            a: 1,
            b: true,
            c: "one",
            d: 2,
            e: false,
            f: "two",
            g: 3,
            h: true,
            i: "three",
            j: 4,
            k: false,
            l: "four",
        };
    }
}