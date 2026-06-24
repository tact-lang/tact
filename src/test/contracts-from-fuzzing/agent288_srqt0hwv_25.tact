struct MixedStruct {
    a: Int as uint32;
    b: Bool = false;
    c: String?;
    d: Address?;
    e: Int? = null;
}

contract TestContract {
    s: MixedStruct;
    init() {
        self.s = MixedStruct{
            a: 5,
            // omit b to use its default false
            c: null,
            d: null,
            // omit e to use default null
        };
    }
}