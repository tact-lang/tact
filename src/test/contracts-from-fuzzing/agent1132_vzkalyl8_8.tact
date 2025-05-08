struct Tiny {
    val: Int as uint4;
}

contract SerializeTest {
    small: Tiny = Tiny{val: 3};
    normal: Int = 12345;
    flag: Bool = false;

    init() {
        self.small = Tiny{val: 15};
        self.flag = true;
    }
}