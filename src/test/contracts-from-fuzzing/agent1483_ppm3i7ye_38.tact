struct SOpt {
    small: Int as uint8;
    big: Int as int257;
    opt1: Int?;
    opt2: Int? as uint8;
}

contract SerializationWithOptionals {
    s: SOpt;

    init() {
        self.s = SOpt{
            small: 1,
            big: 100000000000,
            opt1: null,
            opt2: null
        };
    }
}