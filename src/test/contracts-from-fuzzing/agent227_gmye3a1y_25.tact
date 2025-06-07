struct OptionalStruct {
    nesting: Level?;
}

struct Level {
    value: Int;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{ nesting: null };
    }
}