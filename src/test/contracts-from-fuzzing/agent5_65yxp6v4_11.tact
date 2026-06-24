struct BoolStruct {
    flag: Bool;
}

contract BoolField {
    data: BoolStruct;
    init() {
        self.data = BoolStruct{ flag: true };
    }
}