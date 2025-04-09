struct InnerWithOptional {
    x: Int;
    y: Int?;
}

contract TestNestedOpt {
    point: InnerWithOptional;

    init() {
        self.point = InnerWithOptional{ x: 5, y: null };
    }
}