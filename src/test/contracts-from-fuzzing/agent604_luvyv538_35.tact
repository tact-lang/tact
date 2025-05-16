struct Wrapper {
    v: Address?;
}

contract StructAddrNull {
    s: Wrapper;

    init() {
        self.s = Wrapper{ v: null };
    }
}