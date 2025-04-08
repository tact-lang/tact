struct StructDefaultOpt {
    foo: Int? = null;
    bar: Bool = true;
}

contract DefaultOptInStruct {
    s: StructDefaultOpt;

    init() {
        self.s = StructDefaultOpt{};
    }
}
