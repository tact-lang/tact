struct WeirdOptional {
    foo: Int? as int4;
}

contract Test {
    wo: WeirdOptional;
    init() {
        self.wo = WeirdOptional{ foo: null };
    }
}