struct BoolStruct {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract ManyBools {
    f: BoolStruct;

    init() {
        self.f = BoolStruct{
            a: true,
            b: false,
            c: true
        };
    }
}