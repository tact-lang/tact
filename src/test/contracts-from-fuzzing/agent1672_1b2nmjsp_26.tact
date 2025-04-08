// Complex nested struct with serialization and optionals
struct Nested {
    p: Int as uint8;
    q: String?;
    r: Address?;
}

struct Top {
    x: Int as int64;
    y: Nested;
    z: Bool;
}

contract TestContract {
    t: Top;
    init() {
        self.t = Top{
            x: -44,
            y: Nested{
                p: 3,
                q: null,
                r: myAddress()
            },
            z: true
        };
    }
}