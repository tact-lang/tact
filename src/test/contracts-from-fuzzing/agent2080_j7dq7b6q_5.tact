struct Nested {
    value: Int?;
    nested: Inner?;
}

struct Inner {
    payload: String;
}

contract TestContract {
    data: Nested;
    init() {
        self.data = Nested{
            value: 123,
            nested: Inner{
                payload: "payload",
            }
        };
    }
}