struct NestedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Outer {
    inner: NestedOptionals?;
    num: Int;
}

contract OptionalContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            num: 77,
        };
    }
}