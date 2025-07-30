struct IntOptionalDefaults {
    a: Int?;
    b: Int = 5;
}

contract IntOptDef {
    data: IntOptionalDefaults;

    init() {
        self.data = IntOptionalDefaults{
            a:null,
            b:10
        };
    }
}