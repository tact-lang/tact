struct SRem {
    a: Int;
    b: String;
    rest: Slice as remaining;
}

contract RemainingField {
    data: SRem;

    init() {
        self.data = SRem{a:1,b:"abc",rest:emptyCell().asSlice()};
    }
}