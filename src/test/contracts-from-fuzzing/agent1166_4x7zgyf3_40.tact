// Now attempt nested optional struct with inner defaults set
struct Z1 {
    x: Int = 7;
    y: String?;
}

struct Z2 {
    nested: Z1?;
}

contract NestedOptDefaults {
    s: Z2;
    init() {
        self.s = Z2{
            nested: null
        };
    }
}
