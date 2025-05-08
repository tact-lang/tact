struct Defaulted {
    a: Int = 42;
    b: Bool = true;
    c: Int?;
}

contract StructDefaults {
    val: Defaulted;

    init() {
        self.val = Defaulted{ };
    }
}