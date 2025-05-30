// Test struct with mix of defaults and optionals
struct Mix {
    a: Int?;
    b: Bool = true;
    c: String?;
    d: Slice;
    e: Int = 5;
}

contract MixDefaultsOptionals {
    val: Mix;

    init() {
        self.val = Mix{
            a: null,
            c: null,
            d: emptyCell().asSlice()
        };
    }
}
