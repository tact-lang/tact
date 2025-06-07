struct WeirdMixed {
    foo: Int as uint8;
    bar: Int? as int16;
    zig: Bool?;
}

contract WeirdMixedContract {
    data: WeirdMixed;

    init() {
        self.data = WeirdMixed{
            foo: 42,
            bar: -123,
            zig: true,
        };
    }

    receive() {}
}