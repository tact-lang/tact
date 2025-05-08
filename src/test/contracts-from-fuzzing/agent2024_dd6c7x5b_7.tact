struct X {
    a: Int?;
}

struct Y {
    b: X?;
}

contract NestedOptionalsTest {
    data: Y;

    init() {
        self.data = Y{
            b: null
        };
    }
}