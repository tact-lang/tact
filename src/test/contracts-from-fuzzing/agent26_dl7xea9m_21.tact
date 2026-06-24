struct SimpleStruct {
    val: Int;
    flag: Bool;
}

contract DefaultTest {
    s: SimpleStruct = SimpleStruct{val: 42, flag: false};

    init() {
        self.s = SimpleStruct{val: 55, flag: true};
    }
}