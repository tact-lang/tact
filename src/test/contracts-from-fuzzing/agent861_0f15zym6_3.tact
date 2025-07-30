struct InnerNested {
    flag: Bool = false;
    count: Int = 42;
}

struct Nested {
    inner: InnerNested;
    amount: Int = 7;
}

contract NestedStructsStorage {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerNested{},
        };
    }

    receive() {
        let _ = self.data;
    }
}