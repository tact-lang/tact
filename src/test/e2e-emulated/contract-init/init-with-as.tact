contract Test {
    field: Int as uint8;
    value: Int as int256;
    data: Slice as bytes64;

    init(field: Int as uint8, value: Int as int256, data: Slice as bytes64) {
        self.field = field;
        self.value = value;
        self.data = data;
    }

    receive () {}

    get fun field(): Int {
        return self.field;
    }

    get fun value(): Int {
        return self.value;
    }

    get fun data(): Slice {
        return self.data;
    }
}
