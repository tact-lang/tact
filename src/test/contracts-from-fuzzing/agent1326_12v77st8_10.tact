struct Point {
    x: Int;
    y: Int;
}

struct MaybePoint {
    pt: Point?;
}

contract OptionalStructField {
    data: MaybePoint;
    init() {
        self.data = MaybePoint{
            pt: null,
        };
    }
}