struct WithOpts {
    foo: Int?;
    bar: String?;
    flag: Bool?;
}

contract TestContract {
    optStruct: WithOpts;

    init() {
        self.optStruct = WithOpts{
            foo: null,
            bar: null,
            flag: null
        };
    }
}