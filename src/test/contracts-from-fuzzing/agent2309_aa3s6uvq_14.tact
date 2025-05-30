struct StrNest {
    a: String;
    b: String;
    c: String;
}
contract StrContract {
    s: StrNest;
    init() {
        self.s = StrNest{
            a: "A",
            b: "B",
            c: "C"
        };
    }
}