struct PointOptional {
    x: Int?;
    y: Int?;
}

contract OptionalPoints {
    p: PointOptional;

    init() {
        self.p = PointOptional{
            x: null,
            y: null
        };
    }
}