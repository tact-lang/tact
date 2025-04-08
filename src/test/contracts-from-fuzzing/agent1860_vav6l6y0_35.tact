struct HasBoolInt {
    b: Bool;
    i: Int;
}

contract PartialAssign {
    data: HasBoolInt;

    init() {
        self.data = HasBoolInt{ b: false, i: 14 };
    }
}