struct TwoLevel {
    first: Int;
    second: Nested;
}

struct Nested {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Storage {
    val: TwoLevel;

    init() {
        self.val = TwoLevel{
            first: 1,
            second: Nested{ a:null, b:null, c:null }
        };
    }
}