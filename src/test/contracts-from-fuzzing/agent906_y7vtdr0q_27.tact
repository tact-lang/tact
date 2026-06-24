struct BoolStruct {
    a: Bool;
    b: Bool;
    c: Bool?;
}

contract ManyBools {
    data: BoolStruct;

    init() {
        self.data = BoolStruct {
            a: true,
            b: false,
            c: null,
        };
    }
}