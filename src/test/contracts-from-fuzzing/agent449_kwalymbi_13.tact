struct OptDeep {
    maybeInt: Int?;
    maybeBool: Bool?;
}

struct Level2 {
    embedded: OptDeep?;
}

struct Level1 {
    nested: Level2?;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            nested: Level2{
                embedded: OptDeep{
                    maybeInt: 100,
                    maybeBool: null,
                },
            },
        };
    }
}
