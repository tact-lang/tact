struct DefaultVals {
    a: Int = 0;
    b: Int = 1;
    c: Int = 2;
    d: Int = 3;
    e: Int = 4;
}

contract Fuzz33 {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{};
    }
}