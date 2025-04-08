struct InnerZero { zero: Int; }

contract Defaults {
    data: InnerZero;

    init() {
        self.data = InnerZero{ zero: 0 };
    }
}
