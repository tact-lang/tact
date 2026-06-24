struct OptionalNest {
    x: Int;
    y: Nested?;
}

struct Nested {
    val: Int;
    flag: Bool;
}

contract OptionalFieldStorage {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            x: 10,
            y: null
        };
    }
}