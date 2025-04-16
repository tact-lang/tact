struct OptStruct {
    x: Int;
    y: Int?;
}

contract OptFieldContract {
    os: OptStruct?;

    init() {
        self.os = OptStruct{
            x: 1,
            y: null
        };
    }
}