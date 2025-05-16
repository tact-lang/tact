struct StructOptField {
    val: Int?;
}

contract DefaultedOptStruct {
    s: StructOptField = StructOptField{ val: null };

    init() {
        self.s = StructOptField{ val: 42 };
    }
}