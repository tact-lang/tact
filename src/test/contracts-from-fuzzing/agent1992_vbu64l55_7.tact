struct Detail {
    count: Int;
}

struct Wrapper {
    number: Int;
    optDetail: Detail?;
    inner: Detail;
}

contract Test {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            number: 42,
            optDetail: null,
            inner: Detail{ count: 55 }
        };
    }
}