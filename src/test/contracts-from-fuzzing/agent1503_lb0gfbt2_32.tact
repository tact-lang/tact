struct Big {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Int = 1;
    f: Bool = false;
    g: String = "x";
}

contract BigMix {
    val: Big;
    init() {
        self.val = Big { a:null, b:null, c:null, d:null };
    }
    receive() {}
}