struct BigStruct {
    a: Int; b: Int; c: Int;
    d: Bool; e: Bool; f: Bool;
    g: String; h: String;
    i: Int?; j: Int?;
    k: String?; l: Bool?;
    m: Bool; n: Int; o: String;
}

contract WideStructStorage {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1, b: 2, c: 3,
            d: true, e: false, f: true,
            g: "x", h: "y",
            i: 10, j: null,
            k: null, l: true,
            m: false, n: 100, o: "test"
        };
    }
}