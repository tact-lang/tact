struct Reorder {
    a: Int as int8;
    b: Int;
    c: Int as uint32;
    d: Int;
}

contract SerializedDiffs {
    data: Reorder;

    init() {
        self.data = Reorder{
            a: 5,
            b: 10,
            c: 15,
            d: 20
        };
    }
}