struct OptionalNested {
    a: Int;
    b: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    y: Bool?;
    z: String?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            a: 1,
            b: InnerOpt{
                x: 2,
                y: null,
                z: null
            }
        };
    }
}
