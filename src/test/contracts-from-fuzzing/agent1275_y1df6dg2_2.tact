struct Nested {
    inner: Int;
    optInner: Int?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: 1,
            optInner: null,
        };
    }
}