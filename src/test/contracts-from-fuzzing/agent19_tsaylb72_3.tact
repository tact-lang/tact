struct ManyFields {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: String;
    h: Int;
    i: String;
    j: Bool;
}

contract BigStorageContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: 2,
            d: false,
            e: 3,
            f: true,
            g: "test",
            h: 4,
            i: "more",
            j: false,
        };
    }
}
