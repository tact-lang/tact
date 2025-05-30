struct MultiNestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Level;
}

struct Level {
    d: Int = 5;
    e: Bool? = null;
}

contract NestedDefaultsInitTest {
    s: MultiNestedDefaults;

    init() {
        self.s = MultiNestedDefaults{
            c: Level{}
        };
    }
}