struct SerialOptional {
    num: Int as uint8;
    flag: Bool?;
    val: Int?;
}

contract SerialOptUse {
    foo: SerialOptional;

    init() {
        self.foo = SerialOptional{num: 255, flag: null, val: null};
    }

    receive() {}
}