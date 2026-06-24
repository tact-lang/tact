struct OptionalNest {
    x: Int?;
    y: Bool?;
    sub: SubStruct?;
}

struct SubStruct {
    a: Int;
    b: String?;
}

contract OptTest {
    data: OptionalNest;

    init() {
        self.data = OptionalNest {
            x: null,
            y: true,
            sub: null
        };
    }
}