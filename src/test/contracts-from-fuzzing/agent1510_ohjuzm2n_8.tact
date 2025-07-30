struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestContract {
    f: MultiOpt = MultiOpt{a: null, b: null, c: null};

    init() {
        self.f = MultiOpt{a: null, b: null, c: null};
    }

    receive() {
        let _ = self.f;
    }
}