struct StructWithManyFields {
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

contract ManyFieldStructContract {
    data: StructWithManyFields;

    init() {
        self.data = StructWithManyFields {
            a: 1,
            b: false,
            c: "foo",
            d: 2,
            e: true,
            f: "bar",
            g: 3,
            h: false,
            i: "baz"
        };
    }
}