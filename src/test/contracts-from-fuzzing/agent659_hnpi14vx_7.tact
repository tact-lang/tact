struct Level2 {
    foo: Int?;
    bar: String;
}

struct Level1 {
    nested: Level2?;
}

contract TestContract {
    state: Level1;

    init() {
        self.state = Level1{
            nested: null,
        };
    }
}