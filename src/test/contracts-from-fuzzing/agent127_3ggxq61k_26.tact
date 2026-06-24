struct InnerOpt {
    a: Int?;
}

struct Wrapper {
    val: InnerOpt?;
}

contract DoubleOptionalStruct {
    nested: Wrapper;

    init() {
        self.nested = Wrapper{ val: null };
    }
}