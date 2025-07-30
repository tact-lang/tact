struct IntsAndBools {
    i1: Int;
    i2: Int;
    b1: Bool;
    i3: Int;
    b2: Bool;
}

contract MixedVars {
    val: IntsAndBools;

    init() {
        self.val = IntsAndBools{
            i1: 10,
            i2: 20,
            b1: false,
            i3: 30,
            b2: true,
        };
    }
}