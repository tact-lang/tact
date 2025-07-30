// nested struct where innermost struct contains many optionals
struct InnerMost {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct LevelUp {
    inner: InnerMost;
}

contract NestedOptionals {
    state: LevelUp;
    init() {
        self.state = LevelUp{
            inner: InnerMost{
                a: null,
                b: null,
                c: "deep opt"
            }
        };
    }
}