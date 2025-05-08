struct SBoolOpt {
    a: Bool?;
    b: Bool;
}

struct Outer {
    inner: SBoolOpt;
    flag: Bool;
}

contract OptBoolNested {
    store: Outer;

    init() {
        self.store = Outer{
            inner: SBoolOpt{
                a: null,
                b: true
            },
            flag: false
        };
    }
}