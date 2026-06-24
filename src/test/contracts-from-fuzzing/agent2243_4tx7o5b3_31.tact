struct Dual {
    a: Int;
    b: Bool;
}

contract DefaultsInStruct {
    data: Dual = Dual{a: 0, b: false};

    init() {
        self.data = Dual{a: 1, b: true};
    }
}
