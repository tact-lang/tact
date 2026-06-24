struct Nested {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    message: String;
}

contract PersistentOptional {
    nested: Nested;

    init() {
        self.nested = Nested{
            inner: null,
        };
    }
}
