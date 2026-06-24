struct OptionalInnerStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    text: String;
    number: Int;
}

contract NullInnerInStruct {
    st: OptionalInnerStruct;
    init() {
        self.st = OptionalInnerStruct{inner:null};
    }
}