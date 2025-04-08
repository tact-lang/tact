struct Levels {
    first: Int;
    second: InnerLevel;
    third: Int;
}

struct InnerLevel {
    flag: Bool;
}

contract MixedOrder {
    store: Levels;

    init() {
        self.store = Levels{
            first: 1,
            second: InnerLevel{flag: true},
            third: 3,
        };
    }
}
