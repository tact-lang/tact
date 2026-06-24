struct OptStruct {
    x: Int;
    y: Bool;
}

contract OptNest {
    data: OptStruct?;

    init() {
        self.data = OptStruct{
            x: 42,
            y: true
        };
    }
}