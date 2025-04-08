struct Level3 {
    payload: Int?;
}

struct Level2 {
    nest3: Level3;
    flag: Bool;
}

struct Level1 {
    nest2: Level2;
    message: String;
}

contract TestContract {
    store: Level1;

    init() {
        self.store = Level1{
            nest2: Level2{
                nest3: Level3{ payload: null },
                flag: true
            },
            message: "deep nesting opt"
        };
    }
}