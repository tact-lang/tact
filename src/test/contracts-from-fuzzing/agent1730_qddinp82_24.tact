struct SOption {
    val: Int;
}

contract TopOptPrimStruct {
    optStruct: SOption?;
    prim: Int = 0;

    init() {
        self.optStruct = null;
        self.prim = 11;
    }
}