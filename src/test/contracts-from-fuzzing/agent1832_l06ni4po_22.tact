struct RefStruct {
    inner: Bool;
    value: Int;
}

struct ContainStruct {
    ref1: RefStruct;
    ref2: RefStruct;
}

contract MultipleStructRefs {
    combined: ContainStruct;

    init() {
        self.combined = ContainStruct{
            ref1: RefStruct{inner: true, value: 1},
            ref2: RefStruct{inner: false, value: 2}
        };
    }
}
