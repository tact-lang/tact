struct NestedDefault {
    x: Int = 12;
}

struct OuterDefault {
    inner: NestedDefault = NestedDefault{};
}

contract NestedDefaultStructField {
    val: OuterDefault;

    init() {
        self.val = OuterDefault{};
    }
}