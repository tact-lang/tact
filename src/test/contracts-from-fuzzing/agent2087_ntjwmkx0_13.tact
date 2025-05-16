struct IntsAndBools {
    one: Int;
    two: Int;
    a: Bool;
    b: Bool;
}

contract MixPersistence {
    data: IntsAndBools;

    init() {
        self.data = IntsAndBools{
            one: 1,
            two: 2,
            a: true,
            b: false
        };
    }
}