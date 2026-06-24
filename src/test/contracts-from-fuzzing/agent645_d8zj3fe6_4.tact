struct IntLayer {
    value: Int;
}

struct MiddleLayer {
    nested: IntLayer;
}

struct OuterLayer {
    wrap: MiddleLayer;
}

contract WrapTest {
    data: OuterLayer;

    init() {
        self.data = OuterLayer{
            wrap: MiddleLayer{
                nested: IntLayer{
                    value: 123
                }
            }
        };
    }
}
