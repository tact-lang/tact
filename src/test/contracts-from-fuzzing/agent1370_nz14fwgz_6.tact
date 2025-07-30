struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
}

contract PersistentStruct {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: true,
            c: "one",
            d: 2,
            e: false,
            f: "two",
            g: 3
        };
    }
}