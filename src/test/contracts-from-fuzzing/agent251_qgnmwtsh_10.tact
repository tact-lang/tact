struct Mid {
    z: Bool;
    y: String;
}

struct Container {
    id: Int;
    info: Mid;
}

contract NestedOptional {
    data: Container?;

    init() {
        self.data = null;
    }
}