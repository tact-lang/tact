struct Nested {
    innermost: String?;
    value: Bool;
}

contract MixedOpt {
    data: Nested;
    init() {
        self.data = Nested{
            innermost: null,
            value: true
        };
    }
}