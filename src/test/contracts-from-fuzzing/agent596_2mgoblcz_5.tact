struct OptNest2 {
    n: Int?;
}

struct OptNest1 {
    x: Int?;
    inner: OptNest2?;
}

contract OptionalNestedTest {
    data: OptNest1;

    init() {
        self.data = OptNest1{
            x: null,
            inner: null
        };
    }
}