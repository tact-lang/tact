struct Nested {
    a: Int;
    b: Int?;
    c: Int;
}

contract TestContract {
    persistent: Nested;

    init() {
        self.persistent = Nested{
            a: 10,
            b: null,
            c: 20,
        };
    }
}