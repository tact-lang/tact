struct InnerOpt {
    v: Int?;
}

struct TopOpt {
    inner: InnerOpt?;
    flag: Bool;
}

contract MixedNestedOptionals {
    f: TopOpt;

    init() {
        self.f = TopOpt{
            inner: null,
            flag: false
        };
    }
}