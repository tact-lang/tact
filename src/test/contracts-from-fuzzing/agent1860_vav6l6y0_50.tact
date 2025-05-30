struct BigInit {
    a: Int;
    b: Bool;
    s: String;
}

contract InitInline {
    data: BigInit;

    init() {
        self.data = BigInit{ a: 3, b: false, s: "yo" };
    }
}