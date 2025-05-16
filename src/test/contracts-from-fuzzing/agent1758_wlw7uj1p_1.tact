struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    count: Int;
    note: String;
}

contract StorageTest {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{
                flag: true,
                count: 77,
                note: "hello fuzzy storage"
            }
        };
    }
}