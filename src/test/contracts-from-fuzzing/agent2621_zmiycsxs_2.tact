struct Nested {
    x: Int;
    y: Bool?;
    z: String;
}

struct Wrapper {
    value: Nested;
    note: String?;
}

contract Test {
    w: Wrapper;
    init() {
        self.w = Wrapper{
            value: Nested{
                x: 12,
                y: null,
                z: "hi"
            },
            note: null
        };
    }
}