struct Nested {
    x: Int;
    flag: Bool;
}

contract StructFieldInit {
    s: Nested;

    init() {
        self.s = Nested{
            x: 10,
            flag: true,
        };
    }
}