struct Sub {
    a: Int;
    b: Bool;
}

struct WrapperOpt {
    sub: Sub?;
    flag: Bool;
}

contract OptStructField {
    st: WrapperOpt;

    init() {
        self.st = WrapperOpt{
            sub: null,
            flag: true,
        };
    }
}