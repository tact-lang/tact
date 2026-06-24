struct PermuteOrder {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Int;
    f5: Bool;
}

contract TestContract {
    val: PermuteOrder;

    init() {
        self.val = PermuteOrder{
            f3: true,
            f5: false,
            f2: 2,
            f4: 4,
            f1: 1
        };
    }
}