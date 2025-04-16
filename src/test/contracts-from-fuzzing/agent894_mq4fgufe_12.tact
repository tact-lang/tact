struct Mini {
    flag: Bool;
    opt: Int?;
}

contract DefaultOptionals {
    f: Mini;

    init() {
        self.f = Mini{ flag: true, opt: null };
    }
}