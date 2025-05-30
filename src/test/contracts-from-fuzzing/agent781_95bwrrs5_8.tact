struct DeepOptional {
    lvl1: Int?;
    lvl2: InnerOptional?;
}

struct InnerOptional {
    inner: Int?;
    flag: Bool;
}

contract TestContract {
    f: DeepOptional;

    init() {
        self.f = DeepOptional{
            lvl1: null,
            lvl2: null
        };
    }
}