struct OptDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract DefaultOptVals {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{
            a: null,
            b: null,
            c: null
        };
    }
}