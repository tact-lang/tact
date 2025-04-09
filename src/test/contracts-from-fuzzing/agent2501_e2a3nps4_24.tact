struct NestedSerialization {
    a: Int as int8;
    b: Bool;
    c: Int as uint16;
    d: String;
}

contract WithNestedSerialization {
    data: NestedSerialization;

    init() {
        self.data = NestedSerialization{
            a: 1,
            b: true,
            c: 2,
            d: "a"
        };
    }
}