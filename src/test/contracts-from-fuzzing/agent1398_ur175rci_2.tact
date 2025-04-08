struct NestedOne {
    val: Int;
    flag: Bool;
}

contract NestedFieldContract {
    data: NestedOne;

    init() {
        self.data = NestedOne{ val: 1, flag: true };
    }
}