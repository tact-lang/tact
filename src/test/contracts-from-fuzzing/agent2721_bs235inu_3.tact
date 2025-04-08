struct X_long_fields {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: String;
    f: String;
    g: Int;
    h: Int;
    i: Bool;
    j: Bool;
    k: String;
    l: String;
}

contract ManyFieldsStorage {
    data: X_long_fields;

    init() {
        self.data = X_long_fields{
            a: 1, b: 2, c: true, d: false, e: "hi", f: "bye",
            g: 3, h: 4, i: false, j: true, k: "x", l: "y",
        };
    }
}
