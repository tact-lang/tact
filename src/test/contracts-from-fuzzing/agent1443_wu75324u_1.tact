struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    count: Int;
    data: String;
    optNumber: Int?;
    optStr: String?;
}

contract TestContract {
    storage: Nested;

    init() {
        self.storage = Nested{
            inner: Inner{
                flag: true,
                count: 42,
                data: "hello",
                optNumber: null,
                optStr: null,
            }
        };
    }
}