struct DeepOptionals {
    a: Int?;
    b: Level1?;
}

struct Level1 {
    c: Int?;
    d: Level2?;
}

struct Level2 {
    e: Int?;
}

contract DeepOptionalsContract {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            a: null,
            b: null
        };
    }
}
