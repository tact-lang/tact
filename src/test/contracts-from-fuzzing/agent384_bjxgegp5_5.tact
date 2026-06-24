struct FlatFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
}

contract TestContract {
    storage: FlatFields = FlatFields{
        a: 1,
        b: true,
        c: "hi",
        d: 2,
        e: false,
        f: "hello",
        g: 3,
        h: true,
        i: "bye"
    };

    init() {
        self.storage.d = 4;
    }
}