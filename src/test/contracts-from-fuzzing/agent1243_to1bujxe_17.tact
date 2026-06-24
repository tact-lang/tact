struct Mix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
}

contract Test {
    m: Mix;
    init() {
        self.m = Mix{
            a: 1, b: null, c: true, d: null, e: "yo", f: null, g: myAddress(), h: null
        };
    }
}