struct Nest {
    x: Int;
    y: Int?;
}

contract NestedStruct {
    f: Nest;

    init() {
        self.f = Nest{
            x: 42,
            y: null,
        };
    }
}