struct Level1 {
    one: Int;
    two: Int?;
}

struct Level2 {
    three: Level1;
    four: Level1;
    five: Bool;
}

contract TestContract {
    deepFields: Level2;

    init() {
        self.deepFields = Level2{
            three: Level1{one: 3, two: null},
            four: Level1{one: 4, two: 123},
            five: true,
        };
    }
}