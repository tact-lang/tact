struct OptStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    optVal: OptStruct?;

    init() {
        self.optVal = OptStruct{
            foo: 7,
            bar: true,
        };
    }
}