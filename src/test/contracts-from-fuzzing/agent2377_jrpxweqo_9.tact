struct InnerToggle {
    on: Bool;
}

struct OuterBool {
    toggle: InnerToggle;
}

contract PersistBoolNested {
    b: OuterBool;

    init() {
        self.b = OuterBool{
            toggle: InnerToggle{
                on: false,
            },
        };
    }
}