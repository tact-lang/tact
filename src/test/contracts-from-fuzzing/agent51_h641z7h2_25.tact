struct NestedWithOptional {
    foo: Int?;
    bar: Bool?;
}

contract Combo {
    x: Int = 42;
    y: NestedWithOptional;
    z: Bool = false;
    init() {
        self.y = NestedWithOptional{ foo: null, bar: null };
    }
}