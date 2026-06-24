struct OpStruct {
    a: Int?;
    b: String?;
}

contract ManyNulls {
    state: OpStruct;

    init() {
        self.state = OpStruct {
            a: null,
            b: null
        };
    }
}