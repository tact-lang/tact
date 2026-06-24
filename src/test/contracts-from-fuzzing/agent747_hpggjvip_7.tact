struct OptionalNested {
    n1: Int?;
    n2: Bool?;
}

struct Wrapper {
    opt: OptionalNested?;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper {
            opt: OptionalNested {
                n1: 11,
                n2: null,
            },
        };
    }
}