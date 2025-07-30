struct SOne {
    x: Int;
    y: Bool;
}

struct STwo {
    one1: SOne;
    one2: SOne;
    one3: SOne;
}

contract MultiSOneHolder {
    st: STwo;

    init() {
        self.st = STwo{
            one1: SOne{ x: 1, y: true },
            one2: SOne{ x: 2, y: false },
            one3: SOne{ x: 3, y: true },
        };
    }
}