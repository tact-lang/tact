struct Level3 {
    leafInt: Int;
    leafBool: Bool;
}

struct Level2 {
    child: Level3;
    label: String;
}

struct Level1 {
    nested: Level2;
    description: String;
}

contract TestContract {
    storage: Level1;

    init() {
        self.storage = Level1{
            nested: Level2{
                child: Level3{
                    leafInt: 123,
                    leafBool: true,
                },
                label: "Inner",
            },
            description: "Outer",
        };
    }
}