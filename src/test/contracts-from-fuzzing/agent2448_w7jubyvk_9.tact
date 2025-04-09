struct InnerS {
    foo: Int;
    bar: Bool;
}

contract OptStructField {
    optStruct: InnerS?;
    
    init() {
        self.optStruct = InnerS{
            foo: 5,
            bar: false,
        };
    }
}
