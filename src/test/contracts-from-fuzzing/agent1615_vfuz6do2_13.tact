struct Nested {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct BigStruct {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Nested?;
    h: Nested?;
    i: Nested?;
    j: Int?;
    k: String?;
    l: Bool?;
}

contract TestContract {
    bigField: BigStruct;

    init() {
        self.bigField = BigStruct{
            a: null,
            b: "one",
            c: true,
            d: -7,
            e: null,
            f: null,
            g: null,
            h: Nested{x: 1, y: null, z: "hi"},
            i: null,
            j: 15,
            k: null,
            l: false
        };
    }

    receive() {}
}