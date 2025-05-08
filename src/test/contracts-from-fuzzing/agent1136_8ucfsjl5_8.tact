contract OptionalAssignTest {
    data: Outer?;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 5,
                y: null
            }
        };
    }
}

struct Outer {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: String?;
}
