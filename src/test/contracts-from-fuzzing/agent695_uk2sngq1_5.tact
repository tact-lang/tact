struct Tiny {
    one: Int;
}

struct NestedDefaults {
    x: Tiny = Tiny{ one: 5 };
    y: Int = 10;
    z: Bool = false;
}

contract NestedDefaultsContract {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{};
    }
}