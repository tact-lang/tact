struct Wrapper {
    o: Int?;
}

contract OptionReassign {
    s: Wrapper;

    init() {
        self.s = Wrapper{ o: null };
        self.s = Wrapper{ o: 12 };
    }
}