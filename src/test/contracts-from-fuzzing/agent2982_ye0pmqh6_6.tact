struct InnerOpt {
    x: Int?;
    y: String?;
}

struct OuterOpt {
    innerOpt: InnerOpt?;
    z: Bool = false;
}

contract OptionalStructFieldTest {
    field: OuterOpt = OuterOpt{ innerOpt: null, z: true };

    init() {
        self.field = OuterOpt{
            innerOpt: InnerOpt{ x: 5, y: "Hi" },
            z: false
        };
    }
}