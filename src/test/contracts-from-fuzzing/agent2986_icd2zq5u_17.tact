struct SVal {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalStructVal {
    v: SVal?;

    init() {
        self.v = SVal{ a:1, b:true, c:"v" };
    }
}