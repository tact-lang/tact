struct Base {
    val: Int;
}

struct Middle {
    base: Base;
    msg: String;
}

struct Top {
    mid: Middle;
    addr: Address;
    flag: Bool;
}

contract MixedTest {
    complex: Top;

    init() {
        self.complex = Top{
            mid: Middle{ base: Base{val:5}, msg:"hi" },
            addr: myAddress(),
            flag: true
        };
    }
}