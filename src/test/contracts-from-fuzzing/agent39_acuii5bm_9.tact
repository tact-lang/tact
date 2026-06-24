struct Param {
    x: Int;
}

contract Test {
    field: Int;
    info: Param;

    init() {
        self.field = 123;
        self.info = Param{ x: 777 };
    }
}