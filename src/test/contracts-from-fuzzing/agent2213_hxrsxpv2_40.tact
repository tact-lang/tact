struct DefVal {
    foo: Int = 7;
    bar: Bool = true;
}

struct UseBoth {
    f1: DefVal;
    f2: DefVal;
}

contract DefValNested {
    d: UseBoth;

    init() {
        self.d = UseBoth{
            f1: DefVal{},
            f2: DefVal{},
        };
    }
}
