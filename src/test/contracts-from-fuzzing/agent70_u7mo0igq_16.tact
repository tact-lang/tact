struct BoolPadding {
    a: Bool;
    b: Int as uint256;
    c: Bool;
}

contract TestContract {
    paddingData: BoolPadding;

    init() {
        self.paddingData = BoolPadding{
            a: true,
            b: 999,
            c: false
        };
    }
}