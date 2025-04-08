// Test contract with a struct containing many nested optionals and defaulted
struct Innermost {
    a: Int?;
    b: String?;
}

struct Middle {
    nested: Innermost?;
}

struct Outer {
    middle: Middle?;
    flag: Bool = true;
}

contract ComboDefaults {
    data: Outer;

    init() {
        self.data = Outer{
            middle: null
        };
    }
}