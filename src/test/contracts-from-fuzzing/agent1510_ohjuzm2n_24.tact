struct Inner {
    v: Int?;
}

struct Combo {
    optInt: Int?;
    optInner: Inner?;
    flag: Bool = false;
}

contract TestContract {
    field: Combo = Combo{optInt: null, optInner: null, flag: true};

    init() {
        self.field = Combo{optInt: null, optInner: null, flag: false};
    }

    receive() {
        let _ = self.field;
    }
}