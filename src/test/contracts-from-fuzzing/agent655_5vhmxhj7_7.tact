struct NestedWithDefaults {
    nested: Level;
}

struct Level {
    a: Int = 7;
    b: Int = 14;
    c: Bool;
}

contract TestContract {
    state: NestedWithDefaults;

    init() {
        self.state = NestedWithDefaults{
            nested: Level{
                c: true,
            }
        };
    }
}
