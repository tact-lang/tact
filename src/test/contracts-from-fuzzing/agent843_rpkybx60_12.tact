struct DefinitelyNotInfinite {
    number: Int = 78;
    opt: Int?;
    flag: Bool = false;
}

contract DefaultsAndNulls {
    val: DefinitelyNotInfinite;

    init() {
        self.val = DefinitelyNotInfinite{ number: 90, opt: null, flag: true };
    }
}
