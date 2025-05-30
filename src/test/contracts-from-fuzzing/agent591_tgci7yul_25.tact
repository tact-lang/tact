struct InitTest {
    num: Int;
    flag: Bool;
}

contract InitDefaults {
    data: InitTest;
    init() {
        self.data = InitTest{ num: 0, flag: false };
    }
}