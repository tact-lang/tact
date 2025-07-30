struct Nested {
    inner: Inner;
    note: String;
}

struct Inner {
    flag: Bool;
    count: Int;
}

contract TestContract {
    nested: Nested;
    
    init() {
        self.nested = Nested{
            inner: Inner{flag: false, count: 1},
            note: "test",
        };
    }
}
