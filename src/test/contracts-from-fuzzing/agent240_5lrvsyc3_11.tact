struct OptStruct {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
}

contract ManyOptionalInts {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            f1: null,
            f2: 2,
            f3: null,
            f4: 4,
        };
    }
}