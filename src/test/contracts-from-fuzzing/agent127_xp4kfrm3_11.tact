struct SerialTest {
    small: Int as int8;
    large: Int as int257;
    opt: Int?;
    flag: Bool;
}

contract SerialStruct {
    data: SerialTest;

    init() {
        self.data = SerialTest{small: 1, large: 2, opt: null, flag: true};
    }
}