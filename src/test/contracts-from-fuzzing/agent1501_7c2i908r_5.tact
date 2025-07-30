struct OptStruct {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract TestContract {
    optVals: OptStruct;

    init() {
        self.optVals = OptStruct{
            a: null,
            b: 2,
            c: null,
            d: 4,
            e: 5,
        };
    }
}