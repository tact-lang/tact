struct Nested {
    flag: Bool;
    score: Int;
}

contract WithNested {
    data: Nested;

    init() {
        self.data = Nested{
            flag: true,
            score: 42,
        };
    }
}