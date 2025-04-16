struct OptStruct {
    n: Int?;
    b: Bool?;
}

contract WithOptionalStructField {
    os: OptStruct;

    init() {
        self.os = OptStruct{
            n: null,
            b: true,
        };
    }
}
