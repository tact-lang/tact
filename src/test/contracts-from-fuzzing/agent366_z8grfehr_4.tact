struct Inner {
    s: String?;
    b: Bool?;
}

struct Outer {
    x: Int?;
    y: Inner?;
}

contract NestedOptionalTest {
    data: Outer;

    init() {
        self.data = Outer{
            x: null,
            y: null,
        };
    }
}