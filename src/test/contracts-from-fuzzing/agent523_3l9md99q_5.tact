struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: NestedOpt?;
}

struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract DeepOptionalContract {
    o: DeepOptional;
    init() {
        self.o = DeepOptional{
            x: null,
            y: null,
            z: NestedOpt{a: null, b: true}
        };
    }
}