struct IntOptionStruct {
    val: Int?;
}

contract InitWithOptionals {
    a: Int?;
    si: IntOptionStruct;
    init() {
        self.a = null;
        self.si = IntOptionStruct{val: null};
    }
}