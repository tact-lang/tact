struct S1 {
    n: Int as uint8;
    flag: Bool;
}

contract SerializeContract {
    s: S1;
    init() {
        self.s = S1{ n: 42, flag: true };
    }
}