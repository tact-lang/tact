struct OptionalNested {
    x: Level1?;
}

struct Level1 {
    y: Level2?;
}

struct Level2 {
    z: Int?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            x: null
        };
    }
}