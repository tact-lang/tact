struct Nested {
    inner: Inner?;
    note: String;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract C {
    field: Nested;

    init() {
        self.field = Nested{
            inner: Inner{
                value: 5,
                flag: true
            },
            note: "test"
        };
    }
}