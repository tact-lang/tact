struct Level2 {
    amount: Int;
    isValid: Bool;
}

struct Level1 {
    data: Level2;
    note: String;
}

contract DeeplyNested {
    payload: Level1;

    init() {
        self.payload = Level1{
            data: Level2{ amount: 1000, isValid: true },
            note: "Test"
        };
    }
}