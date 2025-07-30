struct TwoLevels {
    s: Nested;
}

struct Nested {
    a: Int;
    b: String?;
}

contract DeepDefaultOpt {
    t: TwoLevels = TwoLevels{ s: Nested{ a: 1, b: null } };

    init() {
        self.t = TwoLevels{
            s: Nested{ a: 42, b: "hi" }
        };
    }
}