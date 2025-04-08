struct Level3 {
    finalInt: Int;
}

struct Level2 {
    nestedL3: Level3;
}

struct Level1 {
    nestedL2: Level2;
}

contract TestContract {
    deepNest: Level1;

    init() {
        self.deepNest = Level1{
            nestedL2: Level2{
                nestedL3: Level3{ finalInt: 999 }
            }
        };
    }
}