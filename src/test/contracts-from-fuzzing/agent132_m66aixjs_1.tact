struct Nested {
    x: Int;
    y: Int?;
    flag: Bool;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            x: 1,
            y: null,
            flag: true,
        };
    }
}