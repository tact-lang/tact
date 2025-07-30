struct InnerOpt {
    x: Int?;
}

struct MiddleOpt {
    y: InnerOpt?;
}

contract OptionalNestings {
    some: MiddleOpt;

    init() {
        self.some = MiddleOpt { y: null };
    }
}