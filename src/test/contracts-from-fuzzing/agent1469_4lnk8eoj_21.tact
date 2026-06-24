struct DefaultOpt {
    a: Int?;
    b: Bool?;
}

contract DefaultOptVals {
    data: DefaultOpt;

    init() {
        self.data = DefaultOpt{
            a: null,
            b: null
        };
    }
}