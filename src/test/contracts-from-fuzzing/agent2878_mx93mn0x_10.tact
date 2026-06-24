struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: String?;
    f: Int;
}

contract TestContract {
    data: Combo;

    init() {
        self.data = Combo{
            a: 1, b: null, c: "hi", d: true, e: null, f: 42
        };
    }
}