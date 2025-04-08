struct Inner {
    a: Int?;
}

struct Middle {
    b: Inner?;
}

struct Outer {
    c: Middle?;
}

contract NestedOptionalStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            c: Middle{
                b: Inner{ a: null }
            }
        };
    }
}