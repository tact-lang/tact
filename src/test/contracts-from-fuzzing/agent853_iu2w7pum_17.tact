message(1234) M {
    mval: Int;
}

struct Mid {
    optMsg: M?;
}

contract VeryOptional {
    optStruct: Mid?;

    init() {
        self.optStruct = null;
    }
}