struct NarrowOptional {
    a: Int? as uint8;
    b: Int? as int16 = null;
    c: Int? = null;
}

contract TestContract {
    data: NarrowOptional;
    init() {
        self.data = NarrowOptional{
            a: null,
            b: null,
            c: null
        };
    }
}