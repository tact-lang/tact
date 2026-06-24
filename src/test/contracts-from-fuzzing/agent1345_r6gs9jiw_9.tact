struct BoolStruct {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
}

contract BoolPackedTest {
    data: BoolStruct;

    init() {
        self.data = BoolStruct{
            f1: true,
            f2: false,
            f3: true,
            f4: false,
            f5: true
        };
    }
}