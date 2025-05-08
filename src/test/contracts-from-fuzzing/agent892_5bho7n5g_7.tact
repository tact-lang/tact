struct First {
    x: Int;
    y: Bool?;
}

struct Second {
    first: First;
    label: String;
    count: Int;
}

contract NestedStorage {
    second: Second;

    init() {
        self.second = Second{
            first: First{x: 5, y: null},
            label: "ok",
            count: 42
        };
    }
}