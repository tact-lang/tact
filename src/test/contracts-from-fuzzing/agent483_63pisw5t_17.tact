struct OptMidDeep {
    flag: Bool;
    inner: InnerOpt?;
}

struct InnerOpt {
    label: String;
    note: String?;
}

contract MidDeepOpt {
    data: OptMidDeep;

    init() {
        self.data = OptMidDeep{
            flag: true,
            inner: null,
        };
    }
}
