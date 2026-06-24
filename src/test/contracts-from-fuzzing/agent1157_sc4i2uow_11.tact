struct BoolStruct {
    aa: Bool;
    bb: Bool;
    cc: Bool;
    dd: Bool;
    ee: Bool;
}

contract ManyBools {
    data: BoolStruct;

    init() {
        self.data = BoolStruct{ aa: true, bb: false, cc: true, dd: false, ee: true };
    }
}