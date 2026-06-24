struct DeepNested {
    lvl3: Int?;
}

struct Nested {
    lvl2: DeepNested;
}

contract TestContract {
    payload: Nested;
    init() {
        self.payload = Nested{ lvl2: DeepNested{ lvl3: null } };
    }
}