struct HasBool {
    flag: Bool;
}

struct HasInt {
    number: Int;
}

contract MultiStructFields {
    boolData: HasBool;
    intData: HasInt;

    init() {
        self.boolData = HasBool{flag: true};
        self.intData = HasInt{number: 123};
    }
}