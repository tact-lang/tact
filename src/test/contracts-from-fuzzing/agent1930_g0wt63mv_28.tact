struct Param {
    foo: Int;
    bar: Bool;
}

contract StructOverwrite {
    x: Param;

    init() {
        self.x = Param{ foo: 123, bar: true };
        self.x = Param{ foo: 555, bar: false };
    }
}