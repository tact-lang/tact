struct IntsAndBools {
    int1: Int;
    int2: Int;
    bool1: Bool;
    bool2: Bool;
}

contract MixedTest {
    mixed: IntsAndBools;

    init() {
        self.mixed = IntsAndBools{
            int1: 100,
            int2: 200,
            bool1: true,
            bool2: false
        };
    }
}