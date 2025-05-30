struct Nested {
    inner: Int?;
}

struct Wrapper {
    nested: Nested;
    flag: Bool;
}

contract StorageTest {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: Nested{ inner: null },
            flag: true
        };
    }
}