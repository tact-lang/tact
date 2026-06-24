struct Wrapper {
    val: Int?;
}

contract DefaultNullStruct {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{ val: null };
    }
}