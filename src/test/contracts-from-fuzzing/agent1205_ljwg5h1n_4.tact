struct DeepOptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
}

contract TestContract {
    deepOpt: DeepOptionalNested;

    init() {
        self.deepOpt = DeepOptionalNested{inner: null};
    }
}