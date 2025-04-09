struct Composed {
    a: Int;
    b: String;
    optStr: String?;
    optAddr: Address?;
}

contract ComposeMany {
    s: Composed;
    init() {
        self.s = Composed{
            a:1,
            b:"hi",
            optStr:null,
            optAddr:null
        };
    }
}
