struct Thing {
    val: Int = 5;
}

contract NullableStruct {
    t: Thing? = null;

    init() {
        self.t = null;
    }
}
