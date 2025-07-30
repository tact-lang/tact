contract DeepOptionalStructTest {
    foo: Maybe;
    init() {
        self.foo = Maybe{
            val: null,
            flag: true
        };
    }
}

struct Maybe {
    val: Point?;
    flag: Bool;
}

struct Point {
    x: Int;
    y: Int;
}