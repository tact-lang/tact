struct RepeatedOptionalStruct {
    s1: RepOpt?;
    s2: RepOpt?;
    s3: RepOpt?;
}

struct RepOpt {
    value: Int;
}

contract TestContract {
    data: RepeatedOptionalStruct;

    init() {
        self.data = RepeatedOptionalStruct{
            s1: null,
            s2: RepOpt{ value: 5 },
            s3: null
        };
    }
}