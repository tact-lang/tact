struct OptionalNest {
    inner: Inner?;
}

struct Inner {
    point: Point?;
}

struct Point {
    x: Int;
    y: Int;
}

contract NestedOptionals {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            inner: Inner{
                point: Point{
                    x: 1,
                    y: 2,
                }
            }
        };
    }
}