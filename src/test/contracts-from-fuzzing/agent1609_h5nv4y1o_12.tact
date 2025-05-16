// optional of struct containing optionals
struct Level {
    a: Int?;
    b: String?;
}

contract TestContract {
    field: Level?;

    init() {
        self.field = null;
    }

    receive() {
        self.field = Level{
            a: 123,
            b: "foo"
        };
    }
}