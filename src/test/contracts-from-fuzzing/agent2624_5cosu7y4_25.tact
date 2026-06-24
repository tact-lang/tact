struct S {
    a: Int = 1;
    b: Bool? = null;
    c: String = "def";
}

contract StructDefaultsInField {
    s: S;

    init() {
        self.s = S{
            a: 7,
            b: true,
            c: "hey"
        };
    }
}
