struct NestedDefaults {
    a: String = "A";
    b: SubDefault;
}

struct SubDefault {
    c: Int = 5;
    d: Bool;
}

contract NestedDefaultsContract {
    n: NestedDefaults;

    init() {
        self.n = NestedDefaults{ b: SubDefault{ d: true } };
    }
}