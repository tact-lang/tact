struct BigStruct {
 a: Int;
 b: Int?;
 c: Bool;
 d: Bool?;
 e: String;
 f: String?;
 g: Int;
 h: Int?;
 i: Bool;
 j: Bool?;
 k: String;
 l: String?;
 m: Int;
 n: Int?;
 o: Bool;
 p: Bool?;
 q: String;
 r: String?;
}

contract BigStructStorage {
    stuff: BigStruct;

    init() {
        self.stuff = BigStruct{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "a",
            f: null,
            g: 7,
            h: 8,
            i: false,
            j: null,
            k: "k",
            l: "l",
            m: -5,
            n: null,
            o: true,
            p: null,
            q: "q",
            r: null
        };
    }
}