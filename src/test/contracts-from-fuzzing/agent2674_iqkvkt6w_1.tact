struct TwoBools {
    f1: Bool;
    f2: Bool;
}

contract TwoBoolsContract {
    b: TwoBools;

    init() {
        self.b = TwoBools{
            f1: true,
            f2: false,
        };
    }
}