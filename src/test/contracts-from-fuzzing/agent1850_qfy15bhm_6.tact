struct OptStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    s: OptStruct?;

    init() {
        self.s = OptStruct{
            x: 123,
            y: true,
        };
    }
}
