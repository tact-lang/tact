struct HugeInt {
    big: Int as int257;
    other: Int;
}

contract TestContract {
    payload: HugeInt;
    init() {
        self.payload = HugeInt{ big: 0, other: 1 };
    }
}