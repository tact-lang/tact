struct NullableNest {
    inner: Int?;
}

struct Container {
    n: NullableNest;
    m: NullableNest?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            n: NullableNest{ inner: null },
            m: null
        };
    }
}