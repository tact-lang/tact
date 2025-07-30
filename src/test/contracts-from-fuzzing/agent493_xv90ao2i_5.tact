struct DeepOptional {
    x: Int?;
    y: String?;
    z: Bool?;
}

struct Outer {
    opt: DeepOptional;
}

contract OptionalNest {
    data: Outer;

    init() {
        self.data = Outer{
            opt: DeepOptional{
                x: null,
                y: null,
                z: null
            }
        };
    }
}