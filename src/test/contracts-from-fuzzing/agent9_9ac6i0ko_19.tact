struct NestedDefaulted {
    a: Int = 1;
    b: Bool = true;
}

contract NestedWithDefaults {
    val: NestedDefaulted = NestedDefaulted{};

    init() {
        self.val = NestedDefaulted{ a:5, b:false };
    }
}