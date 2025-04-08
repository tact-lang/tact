struct S {
    a: Int = 1;
    b: Bool = false;
    c: String = "def";
    d: Int?; // implicitly null
}

contract EmbedStruct {
    s: S;

    init() {
        self.s = S{
            a: 5,
            b: true,
            c: "x",
            d: null,
        };
    }
}