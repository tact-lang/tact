struct OptWidths {
    a: Int? as uint32;
    b: Bool?;
    c: Int? as int64;
}

contract OptionalWidths {
    data: OptWidths;

    init() {
        self.data = OptWidths{
            a: null,
            b: true,
            c: -12,
        };
    }
}