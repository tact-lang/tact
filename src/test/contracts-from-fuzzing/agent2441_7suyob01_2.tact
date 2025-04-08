struct Nested {
    x: Int;
    y: Bool;
    z: String?;
}

contract NestInStorage {
    data: Nested;

    init() {
        self.data = Nested{
            x: 17,
            y: false,
            z: null,
        };
    }
}